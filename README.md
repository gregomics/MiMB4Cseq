## MiMB4Cseq

This repository contains utility scripts to manipulate fastq files.
They are shell scripts that should work on any Linux/Unix based environment.

### Execution


```bash
./scripts/get_reads_in_paired.sh -h
Usage: ./scripts/get_reads_in_paired.sh
                            -f R1 file
                            -r R2 file
                            -o filtered R1 file
                            -p filtered R2 file
                            -h shows this help
```


```bash
./scripts/get_fastq_with_starting_primer.sh -h
Usage: ./scripts/get_fastq_with_starting_primer.sh
                            -p primer
                            -o output file under fastq format
                            -i input fastq
                            -f force overwrite output
                            -h shows this help

```
