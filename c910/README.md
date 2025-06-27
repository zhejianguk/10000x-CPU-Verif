# C910 CPU Verification Environment

A comprehensive verification framework for the C910 RISC-V processor core using VCS simulation.

## Overview

The C910 is a high-performance RISC-V processor core developed by T-Head (Alibaba). This environment provides:

- VCS-based simulation and verification
- Comprehensive test suite (ISA, MMU, cache, system-level tests)
- Automated build and run workflows
- RISC-V Xuantie toolchain integration

## Prerequisites

- **VCS** (Synopsys Verilog Compiler Simulator) v2018.09+
- **C910 RTL sources** (T-Head C910 RTL factory)
- **Unix/Linux environment** with bash/csh support

## Quick Start

### 1. Setup Environment

```bash
cd 10000x-CPU-Verif/c910

# Setup VCS environment
source ./env_vcs.sh

# Setup RTL Factory
cd ./vcs/C910_RTL_FACTORY/
source ./setup/setup.sh

# Setup Smart Run environment
cd ../smart_run/
source ./setup/setup.sh
```

### 2. Build and Run Tests

```bash
cd ./vcs/smart_run

# Build a test case
make buildcase CASE=hello_world

# Run VCS simulation
make runcase CASE=hello_world SIM=vcs
```

Expected output: "Hello Southeast University! Welcome to 10000x CPU Verif!" message with PASS status.

## Available Test Cases

### Core Tests
- `hello_world` - Basic C program execution
- `smoke` - Minimal functionality tests
- `ISA` - Instruction Set Architecture compliance
- `sleep` - Power management tests

### System Tests
- `MMU` - Memory Management Unit tests
- `cache` - Cache coherency tests
- `csr` - Control and Status Register tests
- `exception` - Exception handling
- `interrupt` - Interrupt controller tests

### Benchmarks
- `coremark` - Industry-standard benchmark
- `debug` - Debug interface verification

## Directory Structure

```
10000x-CPU-Verif/c910/
├── vcs/                         # VCS Simulation Environment
│   ├── C910_RTL_FACTORY/        # RTL Generation and Setup
│   ├── smart_run/               # Main Simulation Framework
│   │   ├── Makefile             # Build system
│   │   ├── setup/               # Environment setup
│   │   ├── tests/cases/         # Test source code
│   │   └── work/                # Generated files (*.pat, *.elf, logs)
│   └── riscv_xuantie/           # RISC-V Xuantie Toolchain
├── doc/                         # Documentation
└── README.md                    # This file
```

## Advanced Usage

### Custom Test Development

1. Create test directory:
   ```bash
   mkdir ./vcs/smart_run/tests/cases/my_test
   ```

2. Write test code (`my_test.c`) in the directory

3. Build and run:
   ```bash
   make buildcase CASE=my_test
   make runcase CASE=my_test SIM=vcs
   ```

### Simulation Options

```bash
# Generate waveforms
make runcase CASE=hello_world SIM=vcs WAVE=1

# Enable coverage collection
make runcase CASE=hello_world SIM=vcs COV=1

# Verbose build output
make buildcase CASE=hello_world VERBOSE=1
```

## Troubleshooting

### Common Issues

- **VCS License**: Check license server connectivity
- **Environment**: Ensure all setup scripts are sourced correctly
- **Build Errors**: Verify RISC-V toolchain installation
- **Simulation**: Check logs in `work/` directory for details

### Debug Tips

- Use `VERBOSE=1` for detailed build output
- Check `work/*.log` files for simulation details
- Verify test completion status and return codes

## License

See `vcs/LICENSE` for licensing information.

