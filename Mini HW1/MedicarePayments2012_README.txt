The dataset describes all Medicare payments made to National Health Providers in 2012.
It is an aggregate showing, for each health care provider, totals of all payments they claimed and received.

The file is in tab-separated-value (.tsv) format, with 21 columns:
----------------------------------------------------------------------------------------------------------------------------

npi                                    National Provider identifier
nppes_provider_last_org_name           National Provider Last Name / Organization Name
nppes_provider_first_name              First Name
nppes_provider_mi                      Middle Initial
nppes_credentials                      Credentials
nppes_provider_gender                  Gender
nppes_entity_code                      Entity Code -- see below
nppes_provider_street1                 Street Address 1
nppes_provider_street2                 Street Address 2
nppes_provider_city                    City
nppes_provider_zip                     Zipcode
nppes_provider_state                   State
nppes_provider_country                 Country
provider_type                          Provider Type -- see below
medicare_participation_indicator       Y/N: Medicare participation?
provider_number_of_hcpcs               Number of HCPCS (Healthcare Common Procedure Coding System) codes for this Provider
total_unique_benes                     Number of unique Medicare Beneficiaries (patients)
total_provider_services                Number of services performed
total_submitted_chrg_amt               Total submitted charge amount
total_medicare_allowed_amt             Total charge amount allowed by Medicare
total_medicare_payment_amt             Total payment amount made by Medicare

----------------------------------------------------------------------------------------------------------------------------

Explanation

nppes_provider_mi
  When the provider is registered in NPPES as an individual (entity type code='I'), this is the provider's middle initial.
  When the provider is registered as an organization (entity type code = `O'), this will be blank.

nppes_credentials
  When the provider is registered in NPPES as an individual (entity type code='I'), these are the provider's credentials.
  When the provider is registered as an organization (entity type code = `O'), this will be blank.

nppes_provider_gender
  When the provider is registered in NPPES as an individual (entity type code='I'), this is the provider's gender.
  When the provider is registered as an organization (entity type code = `O'), this will be blank.

nppes_entity_code
  Type of entity reported in NPPES:
  An entity code of `I' identifies providers registered as individuals and
  an entity type code of `O' identifies providers registered as organizations.

nppes_provider_street1
  The first line of the provider's street address, as reported in NPPES.

nppes_provider_street2
  The second line of the provider's street address, as reported in NPPES.

nppes_provider_city
  The city where the provider is located, as reported in NPPES.

nppes_provider_zip
  The provider's zip code, as reported in NPPES.

nppes_provider_state
  The state where the provider is located, as reported in NPPES.
  The fifty U.S. states and the District of Columbia are reported by the state postal abbreviation.
  The following values are used for other areas: 
    XX = Unknown 
    AA = Armed Forces Central/South America 
    AE = Armed Forces Europe 
    AP = Armed Forces Pacific 
    AS = American Samoa 
    GU = Guam 
    MP = North Mariana Islands 
    PR = Puerto Rico 
    VI = Virgin Islands 
    ZZ = Foreign Country 

nppes_provider_country
  The country where the provider is located, as reported in NPPES.
  The country code will be  US  for any state or U.S possession.
  For foreign countries (i.e., state values of  ZZ ), the provider country values include the following 
    AE = United Arab Emirates 
    AR = Argentina 
    AU = Australia 
    BR = Brazil 
    CA = Canada 
    IL = Israel 
    IN = India 
    IS = Iceland 
    IT = Italy 
    JP = Japan  CH = Switzerland 
    CN = China 
    CO = Colombia 
    DE = Germany 
    ES = Spain 
    FR = France 
    GB = Great Britain 
    HU = Hungary 
    KR = Korea 
    NL = Netherlands 
    PK = Pakistan 
    SA = Saudi Arabia 
    SY = Syria 
    TR = Turkey 
    VE = Venezuela 

Actual amounts permitted by Medicare for fees are described at:
   http://www.cms.gov/apps/physician-fee-schedule/overview.aspx
Each HCPCS code has predefined prices and limiting charges.
Mediare also has Geographic Practice Cost Indexes (rates above or below 1.0), called GPCIs.

There are 87 provider types in the dataset, with very different frequencies:
     9 Addiction Medicine
    19 All Other Suppliers
   284 Allergy/Immunology
   323 Ambulance Service Supplier
   578 Ambulatory Surgical Center
  3422 Anesthesiology
   323 Audiologist (billing independently)
   376 CRNA
    58 Cardiac Electrophysiology
   151 Cardiac Surgery
  1928 Cardiology
    18 Certified Clinical Nurse Specialist
     3 Certified Nurse Midwife
  2908 Chiropractic
   253 Clinical Laboratory
  1107 Clinical Psychologist
    85 Colorectal Surgery (formerly proctology)
   146 Critical Care (Intensivists)
  1267 Dermatology
  2763 Diagnostic Radiology
  3814 Emergency Medicine
   412 Endocrinology
  6141 Family Practice
  1031 Gastroenterology
   971 General Practice
  1501 General Surgery
   119 Geriatric Medicine
    24 Geriatric Psychiatry
    62 Gynecological/Oncology
    82 Hand Surgery
    71 Hematology
   657 Hematology/Oncology
    11 Hospice and Palliative Care
   347 Independent Diagnostic Testing Facility
   391 Infectious Disease
  8552 Internal Medicine
   147 Interventional Pain Management
   140 Interventional Radiology
   413 Licensed Clinical Social Worker
     2 Mammographic Screening Center
  2913 Mass Immunization Roster Biller
    23 Maxillofacial Surgery
   158 Medical Oncology
     9 Multispecialty Clinic/Group Practice
   661 Nephrology
  1096 Neurology
     4 Neuropsychiatry
   374 Neurosurgery
    92 Nuclear Medicine
  1605 Nurse Practitioner
  1746 Obstetrics/Gynecology
   307 Occupational therapist
  1822 Ophthalmology
  2036 Optometry
    65 Oral Surgery (dentists only)
  1866 Orthopedic Surgery
    59 Osteopathic Manipulative Medicine
   755 Otolaryngology
   103 Pain Management
   932 Pathology
   144 Pediatric Medicine
     6 Peripheral Vascular Disease
     2 Pharmacy
   535 Physical Medicine and Rehabilitation
  3827 Physical Therapist
  2376 Physician Assistant
   346 Plastic and Reconstructive Surgery
  1335 Podiatry
    27 Portable X-ray
    48 Preventive Medicine
  1976 Psychiatry
    91 Psychologist (billing independently)
     1 Public Health Welfare Agency
   747 Pulmonary Disease
   394 Radiation Oncology
   115 Registered Dietician/Nutrition Professional
   384 Rheumatology
     2 Sleep Medicine
    12 Slide Preparation Facility
    21 Speech Language Pathologist
    17 Sports Medicine
    63 Surgical Oncology
   156 Thoracic Surgery
     6 Unknown Physician Specialty Code
     3 Unknown Supplier/Provider
   752 Urology
   209 Vascular Surgery
