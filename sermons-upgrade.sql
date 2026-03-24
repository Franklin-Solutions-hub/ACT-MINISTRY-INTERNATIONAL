-- ACT Ministry International - Sermons Table Upgrade
-- Run this script in your Supabase SQL Editor

-- 1. Add new columns to the existing sermons table
ALTER TABLE sermons
ADD COLUMN IF NOT EXISTS preacher TEXT,
ADD COLUMN IF NOT EXISTS audio_url TEXT,
ADD COLUMN IF NOT EXISTS thumbnail_url TEXT,
ADD COLUMN IF NOT EXISTS category TEXT,
ADD COLUMN IF NOT EXISTS scripture TEXT,
ADD COLUMN IF NOT EXISTS is_featured BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS date_preached DATE;

-- 2. Update existing rows with some default values to prevent null errors in EJS
UPDATE sermons 
SET 
  preacher = 'Prophet Samuel Eghan Gorman',
  category = 'Faith',
  is_featured = FALSE,
  date_preached = CURRENT_DATE
WHERE preacher IS NULL;
