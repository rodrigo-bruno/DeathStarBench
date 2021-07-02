import aiohttp
import asyncio
import sys
import time

async def upload_follow(session, addr, user_0, user_1):
  payload = {'user_name': 'username_' + user_0, 'followee_name': 'username_' + user_1}
  async with session.post(addr + "/wrk2-api/user/follow", data=payload) as resp:
    return await resp.text()

async def upload_register(session, addr, user):
  payload = {'first_name': 'first_name_' + user, 'last_name': 'last_name_' + user,
             'username': 'username_' + user, 'password': 'password_' + user, 'user_id': user}
  async with session.post(addr + "/wrk2-api/user/register", data=payload) as resp:
    return await resp.text()


def getNodes(file):
  line = file.readline()
  word = line.split()[0]
  return int(word)

def getEdges(file):
  edges = []
  lines = file.readlines()
  for line in lines:
    edges.append(line.split())
  return edges

async def register(addr, nodes):
  idx = 0
  tasks = []
  start = time.time()
  conn = aiohttp.TCPConnector(limit=conns)
  async with aiohttp.ClientSession(connector=conn) as session:
    for i in range(1, nodes + 1):
      task = asyncio.ensure_future(upload_register(session, addr, str(i)))
      tasks.append(task)
      idx += 1
      if idx % 100 == 0:
        resps = await asyncio.gather(*tasks)
        print("Registered", idx, "users successfully (", 200 / (time.time() - start), "ops/s)")
        start = time.time()
    resps = await asyncio.gather(*tasks)
    print("Registered", idx, "users successfully")


async def follow(addr, edges):
  idx = 0
  tasks = []
  start = time.time()
  conn = aiohttp.TCPConnector(limit=conns)
  async with aiohttp.ClientSession(connector=conn) as session:
    for edge in edges:
      task = asyncio.ensure_future(upload_follow(session, addr, edge[0], edge[1]))
      tasks.append(task)
      task = asyncio.ensure_future(upload_follow(session, addr, edge[1], edge[0]))
      tasks.append(task)
      idx += 1
      if idx % 500 == 0:
        resps = await asyncio.gather(*tasks)
        print(idx, "edges finished (", 500 / (time.time() - start), "ops/s)")
        start = time.time()
    resps = await asyncio.gather(*tasks)
    print(idx, "edges finished")

if __name__ == '__main__':
  if len(sys.argv) != 4:
    print("Syntax: python scripts/init_social_graph.py <url> <connections> <dataset>")
    sys.exit(1)

  addr = sys.argv[1]
  conns = int(sys.argv[2])
  filename = sys.argv[3]

  with open(filename, 'r') as file:
    nodes = getNodes(file)
    edges = getEdges(file)

  print("Using", conns, "concurrent connections.")
  loop = asyncio.get_event_loop()
  future = asyncio.ensure_future(register(addr, nodes))
  loop.run_until_complete(future)
  future = asyncio.ensure_future(follow(addr, edges))
  loop.run_until_complete(future)
