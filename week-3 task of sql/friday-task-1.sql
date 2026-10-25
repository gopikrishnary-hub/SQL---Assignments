CREATE DATABASE GenAI_DB;
use  GenAI_DB
CREATE TABLE AI_Models (
    Model_ID INT PRIMARY KEY,
    Model_Name VARCHAR(100) NOT NULL,
    Model_Type VARCHAR(50) NOT NULL,
    Provider VARCHAR(50) NOT NULL,
    Cost_Per_1K_Tokens DECIMAL(10,4) NOT NULL,
    Release_Date DATE NOT NULL);
CREATE TABLE API_Usage (
    Usage_ID INT PRIMARY KEY,
    Model_ID INT,
    Application_Name VARCHAR(100) NOT NULL,
    Input_Tokens INT NOT NULL,
    Output_Tokens INT NOT NULL,
    Usage_Date DATE NOT NULL,
    Response_Time_Seconds DECIMAL(8,2) NULL, 
    Tasks VARCHAR(255),
    FOREIGN KEY (Model_ID) REFERENCES AI_Models(Model_ID) );
INSERT INTO AI_Models (Model_ID, Model_Name, Model_Type, Provider, Cost_Per_1K_Tokens, Release_Date) VALUES
(1, 'GPT-4o', 'Multimodal', 'OpenAI', 2.5000, '2024-05-13'),
(2, 'Claude 3.5 Sonnet', 'Text/Code', 'Anthropic', 3.0000, '2024-06-21'),
(3, 'Gemini 1.5 Pro', 'Multimodal', 'Google', 1.2500, '2024-04-09'),
(4, 'Llama 3 70B', 'Open-Source LLM', 'Meta', 0.7000, '2024-04-18'),
(5, 'Mistral Large', 'Text Generation', 'Mistral AI', 2.0000, '2024-02-26'),
(6, 'Claude 3 Haiku', 'Text Generation', 'Anthropic', 0.2500, '2024-03-14'); 
INSERT INTO API_Usage (Usage_ID, Model_ID, Application_Name, Input_Tokens, Output_Tokens, Usage_Date, Response_Time_Seconds, Tasks) VALUES
(101, 1, 'Chatbot Pro', 15000, 5000, '2026-10-01', 1.85, 'Customer Support'),
(102, 1, 'Data Analyzer', 45000, 15000, '2026-10-05', 4.20, 'Report Generation'),
(103, 2, 'CodePilot IDE', 8000, 12000, '2026-10-10', 2.10, 'Code Refactoring'),
(104, 2, 'DocuWriter', 20000, 30000, '2026-10-12', 5.50, 'Content Writing'),
(105, 3, 'SmartSearch', 10000, 2000, '2026-10-15', 0.95, 'Semantic Search'),
(106, 3, 'MediaInsight', 60000, 25000, '2026-10-18', 6.40, 'Video Transcription'),
(107, 4, 'OpenAssistant', 5000, 5000, '2026-10-20', 1.40, 'General Q&A'),
(108, 4, 'LocalBot', 12000, 8000, '2026-10-21', NULL, 'Offline Summarization'), 
(109, 5, 'Enterprise AI', 30000, 10000, '2026-10-22', 3.10, 'Legal Analysis'),
(110, 1, 'Chatbot Pro', 25000, 10000, '2026-10-23', 1.20, 'Customer Support');
SELECT 
    m.Model_ID, 
    m.Model_Name, 
    m.Provider, 
    u.Application_Name, 
    u.Input_Tokens, 
    u.Output_Tokens, 
    u.Usage_Date
FROM AI_Models m
INNER JOIN API_Usage u ON m.Model_ID = u.Model_ID;
SELECT 
    m.Model_ID, 
    m.Model_Name, 
    m.Provider, 
    u.Application_Name, 
    u.Usage_Date
FROM AI_Models m
LEFT JOIN API_Usage u ON m.Model_ID = u.Model_ID;
SELECT 
    m.Model_ID, 
    m.Model_Name, 
    m.Provider, 
    u.Application_Name, 
    u.Usage_Date
FROM AI_Models m
RIGHT JOIN API_Usage u ON m.Model_ID = u.Model_ID;
SELECT m.Model_ID, m.Model_Name, u.Usage_ID, u.Application_Name
FROM AI_Models m
LEFT JOIN API_Usage u ON m.Model_ID = u.Model_ID

UNION

SELECT m.Model_ID, m.Model_Name, u.Usage_ID, u.Application_Name
FROM AI_Models m
RIGHT JOIN API_Usage u ON m.Model_ID = u.Model_ID;
SELECT 
    u.Usage_ID,
    m.Model_Name,
    u.Application_Name,
    u.Input_Tokens,
    u.Output_Tokens,
    m.Cost_Per_1K_Tokens,
    ROUND((u.Input_Tokens + u.Output_Tokens) / 1000.0 * m.Cost_Per_1K_Tokens, 4) AS Estimated_Cost_INR
FROM API_Usage u
JOIN AI_Models m ON u.Model_ID = m.Model_ID;
SELECT 
    Usage_ID,
    Application_Name,
    Response_Time_Seconds,
    CASE 
        WHEN Response_Time_Seconds IS NULL THEN 'Not Available'
        WHEN Response_Time_Seconds <= 2 THEN 'Fast'
		WHEN Response_Time_Seconds > 2 AND Response_Time_Seconds <= 5 THEN 'Moderate'
        ELSE 'Slow'
    END AS Response_Time_Category
FROM API_Usage;
SELECT 
    m.Model_Name,
    COUNT(u.Usage_ID) AS Total_API_Calls,
    ROUND(SUM((u.Input_Tokens + u.Output_Tokens) / 1000.0 * m.Cost_Per_1K_Tokens), 2) AS Total_Estimated_Cost
FROM AI_Models m
LEFT JOIN API_Usage u ON m.Model_ID = u.Model_ID
GROUP BY m.Model_ID, m.Model_Name;
SELECT UPPER(Model_Name) AS Uppercase_Model_Name from AI_Models;
SELECT Model_Type,Provider,Release_Date,YEAR(Release_Date) AS Release_Year FROM AI_Models;
SELECT 
    Usage_ID,
    Model_ID,
    Application_Name,
    Input_Tokens,
    Output_Tokens,
    Usage_Date
FROM API_Usage
WHERE YEAR(Usage_Date) = YEAR(CURDATE()) 
  AND MONTH(Usage_Date) = MONTH(CURDATE());
SELECT 
    m.Model_Name,
    COUNT(u.Usage_ID) AS Total_API_Calls,
    ROUND(SUM((u.Input_Tokens + u.Output_Tokens) / 1000.0 * m.Cost_Per_1K_Tokens), 2) AS Total_Estimated_Cost
FROM AI_Models m
JOIN API_Usage u ON m.Model_ID = u.Model_ID
GROUP BY m.Model_ID, m.Model_Name
HAVING Total_Estimated_Cost > 100.00;
    
    
    
    
    
    
    
    
    
    