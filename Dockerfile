FROM ubuntu:focal AS builder

# Setup dev environment
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential

COPY . .

# Compile binary
RUN make transgressor

FROM ubuntu:focal

# Use valgrind in runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
    valgrind

COPY --from=builder /transgressor /usr/local/bin
RUN mkdir -p /massif-out

ENTRYPOINT  [ "valgrind", "--tool", "massif", "--massif-out-file", "/massif-out/transgressor.massif", "/usr/local/bin/transgressor" ]