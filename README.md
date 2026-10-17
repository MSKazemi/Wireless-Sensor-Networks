# Wireless-Sensor-Networks

Wireless Sensor Networks Simulator in Matlab (tree and star topology)

A MATLAB toolset for modelling and analysing **wireless sensor networks (WSN)**. Given a
network described by node positions, parent/child relationships, radio parameters, and the
propagation environment, the simulator evaluates link feasibility and packet delivery for
tree and star topologies.

## What it does

For a network model you define in MATLAB, the code:

- **Builds and plots the network topology** from a parent vector (`treeNetplot.m`), labelling
  the coordinator and each node.
- **Checks node-to-parent connectivity** (`conCheck.m`): a child is considered connected when
  the maximum radio transmission distance implied by its link budget is at least the Euclidean
  distance to its parent.
- **Detects the hidden terminal problem (HTP)** (`HTPCheck.m`): for nodes that share the same
  parent, it flags pairs where one node's transmission can reach the parent but the two nodes
  cannot hear each other.
- **Estimates packet delivery success probability** (`pSuccessTree.m`, `Ps_L.m`): it groups
  nodes by tree level, derives per-level and per-router statistics, and combines per-level
  success probabilities into an end-to-end success probability for the tree.
- **Computes Euclidean distances** between nodes in 2D or 3D (`euclideanDis.m`).

The radio model is a link-budget / path-loss formulation driven by transmit power range,
receiver sensitivity, antenna gains (`Gt`, `Gr`), a path-loss exponent (`Beta`), and the
operating frequency (e.g. 2.4 GHz).

## Network model

A network is described by a `treeNetModel` struct, for example:

- `NodesParents` — parent of each node (`0` marks the coordinator/root).
- `NodeLoc` — node coordinates (2D or 3D).
- `SensRange` — sensing coverage range per node.
- `NodeP` — per-node radio parameters (min/max transmit power in dBm and sensitivity in dBm).
- `NodeBatt` — battery energy per node (`inf` for the mains-powered coordinator).
- `Ch` — radio channel number.
- Environment: `Gt`, `Gr` (antenna gains, dB), `Beta` (path-loss exponent), `f` (frequency, Hz).

## Repository layout

| File | Purpose |
|------|---------|
| `treeWSNsolverRun_V2.m` | Example run script: defines a sample tree model and calls the solver |
| `WSNsolver.m` | Dispatches to the star, tree, or mesh solver by topology |
| `treeWSNsolver.m` | Tree-topology solver: connectivity and hidden terminal analysis |
| `pSuccessTree.m` | End-to-end packet delivery success probability over the tree |
| `Ps_L.m` | Per-level packet transmission success probability |
| `vectorToNodeParentLevelChilderen.m` | Derives node level and child counts from the parent vector |
| `treeNetplot.m` | Plots the network tree (adapted from MATLAB's `treeplot`) |
| `conCheck.m` / `HTPCheck.m` | Connectivity and hidden-terminal link checks |
| `euclideanDis.m` | 2D/3D Euclidean distance |
| `Pmac.m` / `probPortionSD.m` | MAC success and time-portion helpers |
| `readme.txt` | Original call-graph notes |

## How to run in MATLAB

1. Clone the repository and add the folder to the MATLAB path.
2. Open and run the example script:

   ```matlab
   treeWSNsolverRun_V2
   ```

   This defines a sample tree network, plots it, runs the tree solver, and prints the hidden
   terminal problem list, the connectivity results, and the packet success probability.

3. To analyse your own network, edit the `treeNetModel` fields in `treeWSNsolverRun_V2.m`
   (or build the struct yourself) and call:

   ```matlab
   WSNsolver(treeNetModel, 'tree')
   ```

## Notes and limitations

- The **tree topology** path is the most complete. The star and mesh branches of
  `WSNsolver.m` are placeholders/stubs.
- Some helper functions referenced by the solvers (for example `maxTxDis`, `starWSNsolver`,
  `meshWSNsolver`) are not included in this repository.
- `Pmac.m` and `probPortionSD.m` currently return constant placeholder values.
- `treeNetplot.m` is adapted from MATLAB's built-in `treeplot` (Copyright The MathWorks, Inc.).

## Author

Mohsen Seyedkazemi Ardebili — <mohsen.seyedkazemi@gmail.com>

## License

Released under the Apache License 2.0. See [LICENSE](LICENSE).

<!-- legal-notice: start -->
### Legal notice and responsible use

The materials in this repository are made available without warranties to the extent permitted by applicable law. **Please read the [Disclaimer and Responsible-Use Notice](DISCLAIMER.md)** before relying on or deploying them. This notice does not change any existing software license or limit rights that cannot legally be waived.
<!-- legal-notice: end -->
