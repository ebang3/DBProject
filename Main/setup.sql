-- Create the 'states' table
CREATE TABLE IF NOT EXISTS states (
    StateID INT PRIMARY KEY,
    Name VARCHAR(50),
    Nickname VARCHAR(50),
    Capital VARCHAR(50),
    Size INT,
    RegionID INT
);
-- Create the 'regions' table
CREATE TABLE IF NOT EXISTS regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50),
    StateCount INT
);
-- Create the 'demographics' table
CREATE TABLE IF NOT EXISTS demographics (
    DemographicID INT PRIMARY KEY,
    StateID INT,
    TotalPopulation INT,
    AgeDistribution JSON,
    MedianAge DECIMAL(3, 1),
    UrbanizationRate DECIMAL(5, 2),
    FOREIGN KEY (StateID) REFERENCES states(StateID)
);
-- Create the 'diversity' table
CREATE TABLE IF NOT EXISTS diversity (
    DiversityID INT PRIMARY KEY,
    StateID INT,
    RaceEthnicity JSON,
    FOREIGN KEY (StateID) REFERENCES states(StateID)
);
-- Create the 'economy' table
CREATE TABLE IF NOT EXISTS economy (
    EconomyID INT PRIMARY KEY,
    StateID INT,
    GrossStateProduct DECIMAL(10, 2),
    UnemploymentRate DECIMAL(4, 2),
    MedianHouseholdIncome INT,
    PovertyRate DECIMAL(4, 2),
    MajorIndustries JSON,
    FOREIGN KEY (StateID) REFERENCES states(StateID)
);
-- Insert sample data into 'states' table
INSERT INTO states (StateID, Name, Nickname, Capital, Size, RegionID)
VALUES (
        1,
        'California',
        'Golden State',
        'Sacramento',
        163696,
        1
    ),
    (
        2,
        'Texas',
        'Lone Star State',
        'Austin',
        268596,
        2
    ),
    (
        3,
        'Florida',
        'Sunshine State',
        'Tallahassee',
        65758,
        3
    ) ON DUPLICATE KEY
UPDATE Name =
VALUES(Name),
    Nickname =
VALUES(Nickname),
    Capital =
VALUES(Capital),
    Size =
VALUES(Size),
    RegionID =
VALUES(RegionID);
-- Insert sample data into 'regions' table
INSERT INTO regions (RegionID, RegionName, StateCount)
VALUES (1, 'West', 13),
    (2, 'South', 16),
    (3, 'Southeast', 12) ON DUPLICATE KEY
UPDATE RegionName =
VALUES(RegionName),
    StateCount =
VALUES(StateCount);
-- Insert sample data into 'demographics' table
INSERT INTO demographics (
        DemographicID,
        StateID,
        TotalPopulation,
        AgeDistribution,
        MedianAge,
        UrbanizationRate
    )
VALUES (
        1,
        1,
        39538223,
        '{"0-18": 23.5, "19-34": 22.5, "35-54": 27, "55-74": 20, "75+": 7}',
        36.5,
        95
    ),
    (
        2,
        2,
        29145505,
        '{"0-18": 25.2, "19-34": 20.4, "35-54": 28.2, "55-74": 19.2, "75+": 7}',
        35.5,
        85
    ),
    (
        3,
        3,
        21538187,
        '{"0-18": 21.3, "19-34": 21.1, "35-54": 26.8, "55-74": 22.8, "75+": 8}',
        42,
        91
    ) ON DUPLICATE KEY
UPDATE TotalPopulation =
VALUES(TotalPopulation),
    AgeDistribution =
VALUES(AgeDistribution),
    MedianAge =
VALUES(MedianAge),
    UrbanizationRate =
VALUES(UrbanizationRate);
-- Insert sample data into 'diversity' table
INSERT INTO diversity (DiversityID, StateID, RaceEthnicity)
VALUES (
        1,
        1,
        '{"White": 39.4, "Hispanic": 39.3, "Black": 6.5, "Asian": 15.5, "Other": 2.3}'
    ),
    (
        2,
        2,
        '{"White": 41.2, "Hispanic": 40.2, "Black": 12.5, "Asian": 5, "Other": 1.1}'
    ),
    (
        3,
        3,
        '{"White": 53.3, "Hispanic": 26.3, "Black": 16, "Asian": 2.9, "Other": 1.5}'
    ) ON DUPLICATE KEY
UPDATE RaceEthnicity =
VALUES(RaceEthnicity);
-- Insert sample data into 'economy' table
INSERT INTO economy (
        EconomyID,
        StateID,
        GrossStateProduct,
        UnemploymentRate,
        MedianHouseholdIncome,
        PovertyRate,
        MajorIndustries
    )
VALUES (
        1,
        1,
        3200000,
        7.5,
        80000,
        12,
        '["Technology", "Agriculture", "Entertainment"]'
    ),
    (
        2,
        2,
        1800000,
        6.7,
        64000,
        14.5,
        '["Energy", "Agriculture", "Manufacturing"]'
    ),
    (
        3,
        3,
        1100000,
        5.9,
        58000,
        13,
        '["Tourism", "Agriculture", "Healthcare"]'
    ) ON DUPLICATE KEY
UPDATE GrossStateProduct =
VALUES(GrossStateProduct),
    UnemploymentRate =
VALUES(UnemploymentRate),
    MedianHouseholdIncome =
VALUES(MedianHouseholdIncome),
    PovertyRate =
VALUES(PovertyRate),
    MajorIndustries =
VALUES(MajorIndustries);