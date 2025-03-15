This repository is empty. Any task executed on it should be considered a new capability and needs to be created.

## Health Check Script

The `health_check.sh` script analyzes the health of a virtual machine based on CPU, memory, and disk space usage. If any of these three parameters are less than 60% utilized, the script declares the state of the virtual machine as healthy. If any of these parameters are more than 60% utilized, the script declares the health as not healthy.

### Usage

To use the `health_check.sh` script, run the following command:

```bash
./health_check.sh
```

To get an explanation of the health status, use the "explain" argument:

```bash
./health_check.sh explain
```

### Example

Running the script without the "explain" argument:

```bash
$ ./health_check.sh
Health status: healthy
```

Running the script with the "explain" argument:

```bash
$ ./health_check.sh explain
Health status: not healthy
CPU usage: 70.5%
Memory usage: 55.3%
Disk usage: 65.2%
```
