import aiohttp
import asyncio
import sys

async def upload_register(session, addr, user):
  payload = {'first_name': 'first_name_' + user, 'last_name': 'last_name_' + user,
             'username': 'username_' + user, 'password': 'password_' + user, 'user_id': user}
  print(payload)
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
  conn = aiohttp.TCPConnector(limit=200)
  async with aiohttp.ClientSession(connector=conn) as session:
    for i in range(1, 2):
      task = asyncio.ensure_future(upload_register(session, addr, str(i)))
      tasks.append(task)
      idx += 1
      if idx % 200 == 0:
        resps = await asyncio.gather(*tasks)
        print("Registered", idx, "users successfully")
    resps = await asyncio.gather(*tasks)
    print("Registered", idx, "users successfully")


if __name__ == '__main__':
  if len(sys.argv) < 2:
    filename = "datasets/social-graph/socfb-Reed98/socfb-Reed98.mtx"
  else:
    filename = sys.argv[1]
  with open(filename, 'r') as file:
    nodes = getNodes(file)
    edges = getEdges(file)

  addr = "http://127.0.0.1:8080"
  loop = asyncio.get_event_loop()
  future = asyncio.ensure_future(register(addr, nodes))
  loop.run_until_complete(future)
