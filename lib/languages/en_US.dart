const String data_US = '''
{
  "title" : "Home Page",
  "Language" : "Language",
  "EN": "English",
  "ZH": "Chinese",
  "Full Name": "Full Name",
  "Email": "Email",
  "Next Step": "Next Step",
  "Submit Form": "Submit Form",
  "Return to Menu": "Return to Menu",
  "Data Submitted": "Data Submitted",
  "Prediction Records": "Prediction Records",
  "No Record Found": "No records yet",
  "Handling forgotten password": "I am handling forgot password",
  "Prediction A" : "COVID-19 Prediction",
  "Description A" : "COVID-19 is a highly contagious respiratory disease caused by the SARS-CoV-2 virus.",
  "Prediction B" : "Diabetes Prediction",
  "Description B" : "Diabetes is a chronic disease that occurs when the pancreas is no longer able to make insulin, or when the body cannot make good use of the insulin it produces.",
  "Prediction C" : "Heart Disease Pred",
  "Description C" : "Heart disease describes a range of conditions that affect your heart.Such as coronary artery disease, heart rhythm problems and heart defects you're born with , among others.",
  "Prediction D" : "Lung Cancer Pred",
  "Description D" : "Lung cancer is a type of cancer that begins in the lungs.",
  "Go to Prediction" : "Go to Prediction",
  "Disease Prediction" : "Disease Prediction",
  "Profile" : "Profile",
  "Profile Page" : "Profile Page",
  "Log Out" : "Log Out",
  "Check for Logout": "Are you sure you want to log out?",
  "Sore Throat": "Sore Throat",
  "Sore Throat desc": "Sore throat is a painful, dry, or scratchy feeling in the throat.",
  "Cough": "Cough",
  "Cough desc": "A cough is a reflex action to clear your airways of mucus and irritants such as dust or smoke.",
  "Fever": "Fever",
  "Fever desc": "Fever is a temporary increase in your body temperature, often due to an illness.",
  "Shortness of Breath": "Shortness of Breath",
  "Shortness of Breath desc": "Shortness of breath is the feeling that you cannot get enough air into your lungs.",
  "Headache": "Headache",
  "Headache desc": "Headache is a sensation of discomfort or pain in the head or neck region.",
  "Gender": "Gender",
  "Gender desc": "Biological sex refers to the physiological and genetic characteristics that define males and females, such as reproductive organs, hormones, and chromosomes.",
  "Age 60 and Above": "Age 60 and Above",
  "Age 60 and Above desc": "Age 60 and Above",
  "Test Indication": "Test Indication",
  "Test Indication desc": "Test indication refers to the specific reason or medical condition for which a diagnostic or screening test is ordered.",
  "Age": "Age",
  "Enter your Age" : "Enter your age",
  "Enter a valid Age": "Please enter a valid age",
  "Age desc": "Age",
  "Polyuria": "Polyuria",
  "Polyuria desc": "Polyuria is excessive or an abnormally large production or passage of urine.",
  "Polydipsia": "Polydipsia",
  "Polydipsia desc": "Polydipsia is excessive thirst or excess drinking.",
  "Sudden Weight Loss": "Sudden Weight Loss",
  "Sudden Weight Loss desc": "Sudden Weight Loss",
  "Weakness": "Weakness",
  "Weakness desc": "Weakness is a lack of physical or muscle strength and the feeling that extra effort is required to move your arms, legs, or other muscles.",
  "Polyphagia": "Polyphagia",
  "Polyphagia desc": "Polyphagia is excessive hunger or increased appetite.",
  "Genital Thrush": "Genital Thrush",
  "Genital Thrush desc": "Genital Thrush",
  "Visual Blurring": "Visual Blurring",
  "Visual Blurring desc": "Visual Blurring",
  "Itching": "Itching",
  "Itching desc": "Itching",
  "Irritability": "Irritability",
  "Irritability desc": "Irritability",
  "Delayed Healing": "Delayed Healing",
  "Delayed Healing desc": "Delayed Healing",
  "Partial Paresis": "Partial Paresis",
  "Partial Paresis desc": "Partial Paresis",
  "Muscle Stiffness": "Muscle Stiffness",
  "Muscle Stiffness desc": "Muscle Stiffness",
  "Alopecia": "Alopecia",
  "Alopecia desc": "Alopecia",
  "Obesity": "Obesity",
  "Obesity desc": "Obesity",
  "BMI": "BMI",
  "Smoking": "Smoking",
  "Smoking desc": "Smoking",
  "Alcohol Drinking": "Alcohol Drinking",
  "Alcohol Drinking desc": "Alcohol Drinking",
  "Stroke": "Stroke",
  "Stroke desc": "Stroke",
  "Physical Health": "Physical Health",
  "Physical Health desc": "Physical Health",
  "Mental Health": "Mental Health",
  "Mental Health desc": "Mental Health",
  "Chest Pain": "Chest Pain",
  "Chest Pain desc": "Chest Pain",
  "Walking Difficulty": "Walking Difficulty",
  "Walking Difficulty desc": "Walking Difficulty",
  "Age Category": "Age Category",
  "Diabetic": "Diabetic",
  "Diabetic desc": "Diabetic",
  "Physical Activity": "Physical Activity",
  "Physical Activity desc": "Physical Activity",
  "General Health": "General Health",
  "General Health desc": "General Health",
  "Sleep Time": "Sleep Time",
  "Sleep Duration": "Sleep Duration",
  "Asthma": "Asthma",
  "Asthma desc": "Asthma",
  "Kidney Disease": "Kidney Disease",
  "Kidney Disease desc": "Kidney Disease",
  "Skin Cancer": "Skin Cancer",
  "Skin Cancer desc": "Skin Cancer",
  "Yellow Fingers": "Yellow Fingers",
  "Yellow Fingers desc": "Yellow Fingers",
  "Anxiety": "Anxiety",
  "Anxiety desc": "Anxiety",
  "Peer Pressure": "Peer Pressure",
  "Peer Pressure desc": "Peer Pressure",
  "Chronic Disease": "Chronic Disease",
  "Chronic Disease desc": "Chronic Disease",
  "Fatigue": "Fatigue",
  "Fatigue desc": "Fatigue",
  "Allergy": "Allergy",
  "Allergy desc": "Allergy",
  "Wheezing": "Wheezing",
  "Wheezing desc": "Wheezing",
  "Swallowing Difficulty": "Swallowing Difficulty",
  "Swallowing Difficulty desc": "Swallowing Difficulty",
  "Excellent": "Excellent",
  "Very Good": "Very Good",
  "Good": "Good",
  "Fair": "Fair",
  "Poor": "Poor",
  "Select your answer": "Select your answer",
  "Weight": "Weight",
  "Enter your wieght": "Enter your weight",
  "Enter a valid weight": "Please enter a valid weight",
  "Height": "Height",
  "Enter your height": "Enter your height",
  "Enter a valid height": "Please enter a valid height",
  "Mental Health": "Mental Health",
  "Mental Health desc": "Bad feelings days in the past 30 days",
  "Enter your Mental Health": "Enter your mental health",
  "Physical Health": "Physical Health",
  "Physical Health desc": "Illness or injury in the past 30 days",
  "Enter your Physical Health": "Enter your physical health",
  "Enter 0 to 30": "Enter 0 to 30",
  "Enter 0 to 24": "Enter 0 to 24",
  "Sleep Time": "Sleep Time",
  "Sleep Time desc": "Sleep time in the past 24 hours",
  "Enter your Sleep Time": "Enter your sleep time",
  "Enter a valid Sleep Time": "Please enter a valid sleep time",
  "Personal Data Collection Statement": "Personal Data Collection Notice and Consent Form",
  "Details of the Personal Data Collection Statement": "According to Article 8, Paragraph 1 of the Personal Data Protection Act, e-health hereby informs the user of the following matters. Please read carefully:\\n\\n1. The purpose of collecting personal information for this service is solely for disease prediction.\\n\\n2. The personal information collected from the user for this service includes age, gender, email, and physical and mental condition (such as symptoms).\\n\\n3. The period and object of e-health's use of the user's personal information are as follows:\\n (a) Period: throughout the duration of this service.\\n (b) Object: only this service, and only the user himself/herself can access it.\\n\\n4. Pursuant to Article 3 of the Personal Data Protection Act, the user may exercise the following rights with respect to his/her personal information:\\n (a) Inquire or request to review.\\n (b) Request to produce a copy.\\n (c) Request for supplementation or correction.\\n (d) Request to stop collecting, processing, or using.\\n (e) Request to delete. If a deletion is requested, the account will also be deleted.\\n\\n5. The user is free to choose whether or not to provide relevant personal information. However, if the user refuses to provide personal information, this service will be unable to carry out the aforementioned data collection purposes and provide the user with various services.\\n\\n6. The user understands that this consent complies with the requirements of the Personal Data Protection Act and relevant regulations and has the effect of written consent to e-health's collection, processing, and use of the user's personal information.\\n\\n7. If the user needs to modify or request to stop the use of his/her personal information, please contact changcw.ee10@nycu.edu.tw, and e-health will handle it for you.",
  "Disclaimer": "Disclaimer",
  "Details of the Disclaimer": "When you become a user of the (https://e-health.page) website (hereinafter referred to as \\"this service\\"), you have read and understood the \\"Disclaimer\\" in detail and agree that this website shall not be responsible for the following circumstances:\\n\\n1. The risks of using the services of this website shall be borne by the user personally. The user agrees to use the various services of this service based on their personal wishes and agrees to bear any risks themselves. The predictive results of this service are for reference only. If you have any questions, please consult a professional doctor.\\n\\n2. \\"This website\\" does not assume any express or implied warranty responsibility for any services it provides. This service does not guarantee the stability, security, accuracy, or uninterrupted operation of any of its services. Users expressly assume all risks and any damages that may occur from using this service.\\n\\n3. Any data damage, loss, theft, or tampering caused by force majeure events such as computer virus intrusion or attack, or temporary closure due to government control that affect the normal operation of the Internet and are not related to this service. Hereby declared!",
  "Agree": "I agree",
  "Disagree": "I disagree"
}
''';
