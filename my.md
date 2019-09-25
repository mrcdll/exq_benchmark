# Benchmark

Benchmark run from 2019-09-25 00:02:40.434106Z UTC

## System

Benchmark suite executing on the following system:

<table style="width: 1%">
  <tr>
    <th style="width: 1%; white-space: nowrap">Operating System</th>
    <td>macOS</td>
  </tr><tr>
    <th style="white-space: nowrap">CPU Information</th>
    <td style="white-space: nowrap">Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz</td>
  </tr><tr>
    <th style="white-space: nowrap">Number of Available Cores</th>
    <td style="white-space: nowrap">12</td>
  </tr><tr>
    <th style="white-space: nowrap">Available Memory</th>
    <td style="white-space: nowrap">32 GB</td>
  </tr><tr>
    <th style="white-space: nowrap">Elixir Version</th>
    <td style="white-space: nowrap">1.8.1</td>
  </tr><tr>
    <th style="white-space: nowrap">Erlang Version</th>
    <td style="white-space: nowrap">22.0.3</td>
  </tr>
</table>

## Configuration

Benchmark suite executing with the following configuration:

<table style="width: 1%">
  <tr>
    <th style="width: 1%">:time</th>
    <td style="white-space: nowrap">4 s</td>
  </tr><tr>
    <th>:parallel</th>
    <td style="white-space: nowrap">1</td>
  </tr><tr>
    <th>:warmup</th>
    <td style="white-space: nowrap">1 s</td>
  </tr>
</table>

## Statistics


Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">poolboy enqueuer with process lookup</td>
    <td style="white-space: nowrap; text-align: right">7.16 K</td>
    <td style="white-space: nowrap; text-align: right">139.69 μs</td>
    <td style="white-space: nowrap; text-align: right">±83.35%</td>
    <td style="white-space: nowrap; text-align: right">121.98 μs</td>
    <td style="white-space: nowrap; text-align: right">279.98 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">poolboy enqueuer</td>
    <td style="white-space: nowrap; text-align: right">6.49 K</td>
    <td style="white-space: nowrap; text-align: right">154.11 μs</td>
    <td style="white-space: nowrap; text-align: right">±1071.84%</td>
    <td style="white-space: nowrap; text-align: right">122.98 μs</td>
    <td style="white-space: nowrap; text-align: right">315.12 μs</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">poolboy enqueuer with process lookup</td>
    <td style="white-space: nowrap;text-align: right">7.16 K</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">poolboy enqueuer</td>
    <td style="white-space: nowrap; text-align: right">6.49 K</td>
    <td style="white-space: nowrap; text-align: right">1.1x</td>
  </tr>
</table>


<hr/>

