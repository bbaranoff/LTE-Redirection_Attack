import asyncio
import telnetlib3
import random
async def main():
    reader, writer = await telnetlib3.open_connection('172.17.0.2', 30000)

    reply = []
    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)
    t1 = "write n_id_cell "
    t2 = str(random.randrange(0,255))
    t3 = "\n"
    text = t1 + t2 + t3
    writer.write(text)
    reply = []
    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)


    t1 = "write cell_id "
    t2 = str(random.randrange(0,65025))
    t3 = "\n"
    text = t1 + t2 + t3
    writer.write(text)
    reply = []

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)
    writer.write("write mcc 1\n")

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)


    writer.write("write mnc 1\n")

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)


    writer.write("write band 3\n")

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)

    writer.write("write dl_earfcn 1675\n")

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)

    writer.write("write tracking_area_codede 1\n")

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)

    writer.write("write rx_gain 30\n")

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)

    writer.write("write tx_gain 90\n")

    while True:
        c = await reader.read(1)
        if not c:
            break

        if c in ['\r', '\n']:
            break

        reply.append(c)

    print('reply:', ''.join(reply))

asyncio.run(main())
