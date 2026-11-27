
-- ============================================================================
-- FairWork Pulse
-- development_seed.sql
-- Reproducible development/demo data for MySQL.
--
-- IMPORTANT:
-- 1. Run database migrations before seeding.
-- 2. DEVELOPMENT / DEMONSTRATION USE ONLY.
-- 3. No Cognito IDs, passwords or verification codes are seeded.
-- 4. ADMIN accounts are bootstrapped separately through Cognito.
-- 5. EMPLOYER accounts use the application invitation workflow.
-- ============================================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

START TRANSACTION;

-- ============================================================================
-- 1. DEMONSTRATION COMPANIES
-- ============================================================================

-- Company 1: Northstar Retail Ltd

INSERT INTO companies
    (name, industry, location, description, website, status, created_by)
SELECT
    'Northstar Retail Ltd',
    'Retail',
    'London, UK',
    'Synthetic retail organisation used for FairWork Pulse development.',
    NULL,
    'ACTIVE',
    NULL
WHERE NOT EXISTS (
    SELECT 1
    FROM companies
    WHERE name = 'Northstar Retail Ltd'
);

-- Company 2: Apex Logistics Ltd

INSERT INTO companies
    (name, industry, location, description, website, status, created_by)
SELECT
    'Apex Logistics Ltd',
    'Logistics',
    'Cambridge, UK',
    'Synthetic logistics organisation used for FairWork Pulse development.',
    NULL,
    'ACTIVE',
    NULL
WHERE NOT EXISTS (
    SELECT 1
    FROM companies
    WHERE name = 'Apex Logistics Ltd'
);

-- Company 3: Greenfield Technologies Ltd

INSERT INTO companies
    (name, industry, location, description, website, status, created_by)
SELECT
    'Greenfield Technologies Ltd',
    'Technology',
    'Manchester, UK',
    'Synthetic technology organisation used for FairWork Pulse development.',
    NULL,
    'ACTIVE',
    NULL
WHERE NOT EXISTS (
    SELECT 1
    FROM companies
    WHERE name = 'Greenfield Technologies Ltd'
);

-- ============================================================================
-- 2. USER AND COMPANY ACCESS SETUP
-- ============================================================================
-- User profiles are created through the application after Cognito login.
--
-- Initial ADMIN:
-- An authorised AWS operator assigns a verified Cognito user to ADMIN.
--
-- EMPLOYER:
-- An administrator generates an employer invitation code.
-- The employer registers and redeems the code.
-- The backend creates the employer-company association.
--
-- No user_profiles or employer_company_access records are seeded.
-- ============================================================================

COMMIT;
