# DVRPC Vision Eval Implementation

This repository sets out to store and document DVRPC's efforts to create input tables for and customize the VisionEval (specifically VERSPM) Model for scenario planning in the Greater Philadelphia Region.

## Grouping of Input Files by VisionEval General Module Categories

- [0. Model Definition Files](documentation/Generating%20Input%20Tables/0.%20Model%20Definitition%20Files/0.%20Model%20Definition%20Files.md)
- [1. Household](documentation/Generating%20Input%20Tables/1.%20Household/1.%20Household.md)
- [2. Land Use](documentation/Generating%20Input%20Tables/2.%20Land%20Use/2.%20Land%20Use.md)
- [3. Transport Supply](documentation/Generating%20Input%20Tables/3.%20Transport%20Supply/3.%20Transport%20Supply.md)
- [4. Household Vehicle](documentation/Generating%20Input%20Tables/4.%20Household%20Vehicles/4.%20Household%20Vehicle.md)
- [5. Household Travel](documentation/Generating%20Input%20Tables/5.%20Household%20Travel/5.%20Household%20Travel.md)
- [6. Powertrain and Fuel](documentation/Generating%20Input%20Tables/6.%20Powertrain%20and%20Fuel/6.%20Powertrain%20and%20Fuel.md)
- [7. Travel Performance](documentation/Generating%20Input%20Tables/7.%20Travel%20Performance/7.%20Travel%20Performance.md)

## Development Environment

### Python

Use `conda` and the included `environment.yml` file to build a Python environment with all necessary dependencies:

```bash
conda env create -f environment.yml
```

After the creation finishes, point your IDE of choice towards this environment.

### Run the script

With the conda environment activated, you can run the database setup script with:

```bash
python src/create_database.py
```
