
import 'dart:math';

import 'package:aavishkaar/quiz_materials/models/quiz_question.dart';

final List<QuestionQuiz> questions = [
  QuestionQuiz(
    "1. Who appoints the President of India?",
    [
      "The Prime Minister of India",
      "The Parliament of India",
      "The Chief Justice of India",
      "The President of the United States"
    ],
    "The President of India",
    "The President of India is appointed by an electoral college consisting of the elected members of both Houses of Parliament, and the elected members of the Legislative Assemblies of States and Union Territories as per Article 54."
  ),
  QuestionQuiz(
    "2. What is the term of office for the President of India?",
    [
      "5 years",
      "6 years",
      "4 years",
      "7 years"
    ],
    "5 years",
    "As per Article 56 of the Constitution, the President of India holds office for a term of 5 years from the date of assuming office."
  ),
  QuestionQuiz(
    "3. Under which Article can the President of India be impeached?",
    [
      "Article 61",
      "Article 72",
      "Article 76",
      "Article 68"
    ],
    "Article 61",
    "Article 61 of the Constitution specifies the procedure for the impeachment of the President of India. The President can be removed for violation of the Constitution."
  ),
  QuestionQuiz(
    "4. What is the maximum age limit for the President of India?",
    [
      "No age limit",
      "65 years",
      "70 years",
      "75 years"
    ],
    "No age limit",
    "There is no maximum age limit for the President of India as per the Constitution. However, the individual must be at least 35 years old to hold the office."
  ),
  QuestionQuiz(
    "5. Which of the following is NOT a power of the President of India?",
    [
      "To dissolve the Lok Sabha",
      "To grant pardons",
      "To form a government in a state",
      "To appoint the Chief Election Commissioner"
    ],
    "To form a government in a state",
    "The power to form a government in a state lies with the Governor, not the President of India."
  ),
  QuestionQuiz(
    "6. Who advises the President of India in the exercise of their powers?",
    [
      "The Vice President of India",
      "The Prime Minister of India",
      "The Chief Justice of India",
      "The Parliament of India"
    ],
    "The Prime Minister of India",
    "The President of India is expected to act according to the advice of the Prime Minister and the Council of Ministers, as per Article 74."
  ),
  QuestionQuiz(
    "7. Under which Article can the President of India issue ordinances when the Parliament is not in session?",
    [
      "Article 123",
      "Article 65",
      "Article 85",
      "Article 72"
    ],
    "Article 123",
    "Article 123 of the Constitution gives the President the power to promulgate ordinances when the Parliament is not in session, provided certain conditions are met."
  ),
  QuestionQuiz(
    "8. Who is responsible for administering the oath of office to the President of India?",
    [
      "The Chief Justice of India",
      "The Prime Minister of India",
      "The Vice President of India",
      "The Speaker of Lok Sabha"
    ],
    "The Chief Justice of India",
    "As per Article 60, the President of India takes an oath of office administered by the Chief Justice of India before assuming office."
  ),
  QuestionQuiz(
    "9. What is the power of the President regarding the dissolution of the Lok Sabha?",
    [
      "To dissolve it at any time",
      "To dissolve it only on the advice of the Prime Minister",
      "To dissolve it on the advice of the Speaker",
      "Cannot dissolve the Lok Sabha"
    ],
    "To dissolve it only on the advice of the Prime Minister",
    "Article 85 gives the President the power to dissolve the Lok Sabha, but this can only be done on the advice of the Prime Minister."
  ),
  QuestionQuiz(
    "10. Which of the following is a discretionary power of the President of India?",
    [
      "To appoint the Prime Minister",
      "To appoint Governors of States",
      "To summon or prorogue sessions of Parliament",
      "To grant pardons"
    ],
    "To appoint the Prime Minister",
    "The President's power to appoint the Prime Minister is discretionary, and they must appoint the leader who is most likely to command the majority in the Lok Sabha."
  ),
  QuestionQuiz(
    "11. Who can remove the President of India from office?",
    [
      "The Parliament",
      "The Supreme Court",
      "The Vice President",
      "The Lok Sabha"
    ],
    "The Parliament",
    "The President of India can be removed by impeachment, which is initiated in the Parliament as per the procedure laid down in Article 61."
  ),
  QuestionQuiz(
    "12. What is the minimum age required to become the President of India?",
    [
      "35 years",
      "30 years",
      "40 years",
      "50 years"
    ],
    "35 years",
    "As per Article 58, the minimum age required for a person to become the President of India is 35 years."
  ),
  QuestionQuiz(
    "13. Which of the following appointments does the President of India make?",
    [
      "Appointment of Governors",
      "Appointment of Judges of the Supreme Court",
      "Appointment of Chief Election Commissioner",
      "All of the above"
    ],
    "All of the above",
    "The President of India appoints Governors, Judges of the Supreme Court, and the Chief Election Commissioner as per the Constitution."
  ),
  QuestionQuiz(
    "14. Under which article can the President of India dissolve the Lok Sabha?",
    [
      "Article 85",
      "Article 72",
      "Article 90",
      "Article 91"
    ],
    "Article 85",
    "Article 85 of the Constitution gives the President of India the power to dissolve the Lok Sabha, upon the advice of the Prime Minister."
  ),
  QuestionQuiz(
    "15. What is the role of the President of India in the impeachment process?",
    [
      "To initiate the process",
      "To be the judge",
      "To issue a final ruling",
      "To act as the presiding officer"
    ],
    "To initiate the process",
    "The President of India does not act as the judge or presiding officer in an impeachment. However, they initiate the process when a resolution is passed in both Houses of Parliament."
  ),
  QuestionQuiz(
    "16. Who can give advice to the President in matters related to the appointment of judges?",
    [
      "The Chief Justice of India",
      "The Prime Minister of India",
      "The Vice President of India",
      "The Union Minister of Law and Justice"
    ],
    "The Prime Minister of India",
    "In appointing judges, the President is expected to act according to the advice of the Prime Minister and the Council of Ministers."
  ),
  QuestionQuiz(
    "17. Which power does the President of India have in relation to the armed forces?",
    [
      "Commander-in-Chief",
      "To declare war",
      "To appoint military commanders",
      "To conduct military operations"
    ],
    "Commander-in-Chief",
    "The President of India is the Commander-in-Chief of the Indian Armed Forces as per Article 53."
  ),
  QuestionQuiz(
    "18. Under which Article is the President of India empowered to call for special sessions of Parliament?",
    [
      "Article 85",
      "Article 87",
      "Article 88",
      "Article 90"
    ],
    "Article 87",
    "As per Article 87, the President can address the Parliament and call for special sessions as deemed necessary."
  ),
  QuestionQuiz(
    "19. What is the power of the President regarding the appointment of the Prime Minister?",
    [
      "To select any member of Parliament",
      "To select the leader of the largest party",
      "To select the leader of the opposition",
      "To select any member of the Lok Sabha"
    ],
    "To select the leader of the largest party",
    "The President of India appoints the Prime Minister, typically the leader of the largest party in the Lok Sabha."
  ),
  QuestionQuiz(
    "20. Which Article empowers the President to grant pardons, reprieves, and respites?",
    [
      "Article 72",
      "Article 74",
      "Article 80",
      "Article 81"
    ],
    "Article 72",
    "Article 72 of the Constitution gives the President of India the power to grant pardons, reprieves, respites, and remissions of punishment, and to suspend or commute sentences."
  ),

  QuestionQuiz(
  "21. Who appoints the Vice President of India?",
    [
      "The President of India",
      "The Prime Minister of India",
      "The Parliament of India",
      "The people of India"
    ],
    "The Parliament of India",
    "The Vice President of India is elected by an electoral college consisting of the elected members of both Houses of Parliament, as per Article 66."
  ),
  QuestionQuiz(
    "22. The President of India is the ex-officio head of which institution?",
    [
      "The Union Government",
      "The Supreme Court",
      "The Parliament of India",
      "The Election Commission"
    ],
    "The Union Government",
    "The President of India is the ceremonial head of the Union Government and is considered the symbol of unity, integrity, and sovereignty of India as per Article 52."
  ),
  QuestionQuiz(
    "23. What happens if a candidate for the office of President of India is elected unopposed?",
    [
      "They still need to take an oath of office",
      "They become the Vice President automatically",
      "There is no need for an election",
      "They can only assume office after confirmation"
    ],
    "They still need to take an oath of office",
    "Even if elected unopposed, the President-elect must take the oath of office before assuming their duties as per Article 60."
  ),
  QuestionQuiz(
    "24. Who decides the election procedure for the President of India?",
    [
      "The Election Commission",
      "The President of India",
      "The Parliament of India",
      "The Chief Justice of India"
    ],
    "The Parliament of India",
    "The election procedure for the President of India is decided by Parliament and is described under Article 55."
  ),
  QuestionQuiz(
    "25. Which of the following is true about the election of the President of India?",
    [
      "It is conducted by the Election Commission",
      "It is conducted by the Chief Justice of India",
      "It is conducted by the Speaker of the Lok Sabha",
      "It is conducted by the President of India"
    ],
    "It is conducted by the Election Commission",
    "The Election Commission of India conducts the presidential election, ensuring the proper procedures are followed."
  ),
  QuestionQuiz(
    "26. What is the maximum number of terms a person can serve as the President of India?",
    [
      "2 terms",
      "3 terms",
      "There is no limit",
      "1 term"
    ],
    "There is no limit",
    "The Constitution does not impose a maximum number of terms for the President of India. They can serve for more than one term if re-elected."
  ),
  QuestionQuiz(
    "27. The President of India exercises executive powers under which Article?",
    [
      "Article 52",
      "Article 53",
      "Article 56",
      "Article 58"
    ],
    "Article 53",
    "Article 53 vests the executive power of the Union in the President of India, who exercises it either directly or through officers subordinate to them."
  ),
  QuestionQuiz(
    "28. In which situation can the President of India take action without the advice of the Council of Ministers?",
    [
      "In national emergencies",
      "In foreign policy matters",
      "When the Prime Minister advises them",
      "None of the above"
    ],
    "In national emergencies",
    "In situations like a national emergency, the President of India can take action without the advice of the Council of Ministers, as per Article 74."
  ),
  QuestionQuiz(
    "29. What is the significance of the President of India’s power to promulgate ordinances?",
    [
      "To create new laws without Parliament’s approval",
      "To amend the Constitution",
      "To pass emergency laws",
      "To dissolve the Rajya Sabha"
    ],
    "To create new laws without Parliament’s approval",
    "Article 123 allows the President of India to issue ordinances when Parliament is not in session, making temporary laws that have the same force as Acts of Parliament."
  ),
  QuestionQuiz(
    "30. What power does the President of India have regarding the Parliament's sessions?",
    [
      "To summon and prorogue Parliament",
      "To dissolve Parliament",
      "To pass bills without Parliament’s approval",
      "To approve or veto a law"
    ],
    "To summon and prorogue Parliament",
    "The President of India has the power to summon and prorogue sessions of Parliament, and also to dissolve the Lok Sabha as per Article 85."
  ),
  QuestionQuiz(
    "31. What is the main role of the President of India regarding the Indian Armed Forces?",
    [
      "To command the armed forces",
      "To declare war",
      "To appoint the Defence Minister",
      "To supervise military operations"
    ],
    "To command the armed forces",
    "The President of India is the Commander-in-Chief of the Armed Forces, as stated in Article 53, but military decisions are made by the Union Cabinet."
  ),
  QuestionQuiz(
    "32. Under which article can the President of India address the Parliament?",
    [
      "Article 85",
      "Article 87",
      "Article 88",
      "Article 90"
    ],
    "Article 87",
    "Article 87 allows the President to address the Parliament, both at the commencement of the first session after each general election, and at the beginning of the first session each year."
  ),
  QuestionQuiz(
    "33. Can the President of India refuse to give assent to a bill?",
    [
      "Yes, at any time",
      "Yes, but only if advised by the Prime Minister",
      "No, they must always give assent",
      "No, they have no veto power"
    ],
    "Yes, but only if advised by the Prime Minister",
    "The President of India has the power to withhold assent to a bill, but this must be done on the advice of the Prime Minister."
  ),
  QuestionQuiz(
    "34. Who can represent the President of India in their absence?",
    [
      "The Vice President of India",
      "The Prime Minister of India",
      "The Chief Justice of India",
      "The Speaker of the Lok Sabha"
    ],
    "The Vice President of India",
    "In the absence of the President of India, the Vice President assumes the duties and powers of the President as per Article 65."
  ),
  QuestionQuiz(
    "35. What happens if the President of India’s office becomes vacant?",
    [
      "The Vice President becomes the President",
      "The Prime Minister takes over",
      "Elections are held immediately",
      "The Speaker of the Lok Sabha becomes the President"
    ],
    "The Vice President becomes the President",
    "If the President's office becomes vacant due to death, resignation, or impeachment, the Vice President acts as President until a new President is elected, as per Article 65."
  ),
  QuestionQuiz(
    "36. Under which article is the President of India authorized to promulgate ordinances?",
    [
      "Article 123",
      "Article 72",
      "Article 74",
      "Article 76"
    ],
    "Article 123",
    "Article 123 gives the President of India the power to promulgate ordinances when Parliament is not in session, to meet urgent legislative requirements."
  ),
  QuestionQuiz(
    "37. What is the role of the President in the declaration of a national emergency?",
    [
      "They can declare it directly",
      "They require approval from Parliament",
      "They can only propose it to the Prime Minister",
      "They can only act after the Cabinet agrees"
    ],
    "They require approval from Parliament",
    "Under Article 352, the President can declare a national emergency, but it requires approval from both Houses of Parliament."
  ),
  QuestionQuiz(
    "38. Can the President of India dissolve the Rajya Sabha?",
    [
      "Yes",
      "No",
      "Yes, but only after a national emergency",
      "Yes, but only with the approval of the Supreme Court"
    ],
    "No",
    "The President of India does not have the power to dissolve the Rajya Sabha. Only the Lok Sabha can be dissolved by the President under Article 85."
  ),
  QuestionQuiz(
    "39. Who is responsible for the administration of the President of India’s office?",
    [
      "The Ministry of Defence",
      "The Ministry of Home Affairs",
      "The Secretariat of the President",
      "The Prime Minister's Office"
    ],
    "The Secretariat of the President",
    "The administrative functions and duties of the President's office are managed by the Secretariat of the President."
  ),
  QuestionQuiz(
    "40. What is the process for removing the President of India from office?",
    [
      "Impeachment by Parliament",
      "Resignation by the President",
      "Appointment of a new President",
      "None of the above"
    ],
    "Impeachment by Parliament",
    "The President of India can be removed from office through the impeachment process outlined in Article 61 of the Constitution."
  ),

  QuestionQuiz(
    "41. Under which Article can the President of India promulgate ordinances?",
    [
      "Article 73",
      "Article 123",
      "Article 84",
      "Article 68"
    ],
    "Article 123",
    "The President of India can promulgate ordinances under Article 123 when Parliament is not in session, enabling them to make laws with the same force as Acts of Parliament."
  ),
  QuestionQuiz(
    "42. Who can advise the President of India on the use of executive powers?",
    [
      "The Prime Minister and Council of Ministers",
      "The Chief Justice of India",
      "The Speaker of Lok Sabha",
      "The Parliament"
    ],
    "The Prime Minister and Council of Ministers",
    "The President of India acts according to the advice of the Council of Ministers headed by the Prime Minister, as stated in Article 74."
  ),
  QuestionQuiz(
    "43. What is the process if the President of India wants to dissolve the Lok Sabha?",
    [
      "The President can dissolve it directly",
      "The President needs the Prime Minister’s recommendation",
      "The President requires a vote of confidence from the Cabinet",
      "The President can only dissolve the Lok Sabha under national emergency"
    ],
    "The President needs the Prime Minister’s recommendation",
    "The President can dissolve the Lok Sabha only after receiving the advice of the Prime Minister and Council of Ministers, as per Article 85."
  ),
  QuestionQuiz(
    "44. What is the term of office for the President of India?",
    [
      "6 years",
      "5 years",
      "4 years",
      "3 years"
    ],
    "5 years",
    "The President of India is elected for a term of 5 years, as stipulated in Article 56 of the Constitution."
  ),
  QuestionQuiz(
    "45. What happens if the President of India dies in office?",
    [
      "The Vice President assumes the role of President",
      "The Prime Minister assumes the role of President",
      "A new President is immediately elected",
      "The Speaker of Lok Sabha assumes the role of President"
    ],
    "The Vice President assumes the role of President",
    "In the event of the death of the President, the Vice President temporarily assumes the duties of the President until a new President is elected, as per Article 65."
  ),
  QuestionQuiz(
    "46. Which of the following can the President of India dissolve?",
    [
      "Lok Sabha",
      "Rajya Sabha",
      "Both Houses of Parliament",
      "State Assemblies"
    ],
    "Lok Sabha",
    "The President of India has the power to dissolve the Lok Sabha but cannot dissolve the Rajya Sabha, as per Article 85."
  ),
  QuestionQuiz(
    "47. What is the President of India's role in the impeachment of a Judge of the Supreme Court?",
    [
      "The President can initiate the process",
      "The President can approve the impeachment after it is passed by both Houses",
      "The President has no role in the impeachment of Judges",
      "The President can suspend the Judge during the impeachment process"
    ],
    "The President can approve the impeachment after it is passed by both Houses",
    "The President of India plays a role in the impeachment of a Judge of the Supreme Court by giving assent after the impeachment motion is passed by both Houses of Parliament."
  ),
  QuestionQuiz(
    "48. Who can recommend the dissolution of the Lok Sabha to the President of India?",
    [
      "The Chief Justice of India",
      "The Speaker of the Lok Sabha",
      "The Prime Minister",
      "The Rajya Sabha"
    ],
    "The Prime Minister",
    "The Prime Minister, along with the Cabinet, advises the President on dissolving the Lok Sabha, as per Article 85."
  ),
  QuestionQuiz(
    "49. Which of the following is an executive power of the President of India?",
    [
      "The power to pass laws",
      "The power to issue ordinances",
      "The power to form policies",
      "The power to conduct elections"
    ],
    "The power to issue ordinances",
    "As the executive head, the President of India can issue ordinances under Article 123 when Parliament is not in session, enabling legislative action on urgent matters."
  ),
  QuestionQuiz(
    "50. The President of India can veto a bill passed by the Parliament in which of the following ways?",
    [
      "Absolute veto",
      "Suspensive veto",
      "Power of referral",
      "All of the above"
    ],
    "All of the above",
    "The President of India can exercise the absolute veto (withholding assent), suspensive veto (sending the bill back to Parliament), and the power of referral (to a joint sitting of Parliament)."
  ),
  QuestionQuiz(
    "51. Which article of the Indian Constitution defines the President's powers in relation to bills?",
    [
      "Article 74",
      "Article 111",
      "Article 72",
      "Article 56"
    ],
    "Article 111",
    "Article 111 gives the President the power to assent, withhold assent, or return a bill for reconsideration by Parliament."
  ),
  QuestionQuiz(
    "52. Under which Article is the President of India responsible for protecting the Constitution?",
    [
      "Article 48",
      "Article 56",
      "Article 72",
      "Article 60"
    ],
    "Article 60",
    "Article 60 requires the President of India to take an oath to preserve, protect, and defend the Constitution of India."
  ),
  QuestionQuiz(
    "53. Can the President of India remove the Prime Minister?",
    [
      "Yes, if they lose majority support",
      "Yes, at their discretion",
      "No, the President can only ask for a resignation",
      "No, the President has no power to remove the Prime Minister"
    ],
    "Yes, if they lose majority support",
    "If the Prime Minister loses the confidence of the Lok Sabha, the President can dismiss them and appoint a new Prime Minister."
  ),
  QuestionQuiz(
    "54. What is the role of the President in the appointment of Governors?",
    [
      "The President directly appoints Governors",
      "The President needs approval from the Prime Minister for each appointment",
      "The President can only recommend Governors",
      "The President nominates Governors but the states elect them"
    ],
    "The President directly appoints Governors",
    "Under Article 155, the President of India appoints the Governors of the states on the advice of the Prime Minister."
  ),
  QuestionQuiz(
    "55. Who holds the power to make appointments to the Union Public Service Commission?",
    [
      "The President of India",
      "The Prime Minister of India",
      "The Parliament of India",
      "The Chief Justice of India"
    ],
    "The President of India",
    "The President of India appoints the members of the Union Public Service Commission (UPSC) as per Article 316."
  ),
  QuestionQuiz(
    "56. What is the role of the President in the formation of a new government?",
    [
      "The President can form a new government",
      "The President can appoint the Prime Minister",
      "The President can dissolve the government",
      "The President can only approve the government formed"
    ],
    "The President can appoint the Prime Minister",
    "The President appoints the Prime Minister and other ministers, based on the majority in the Lok Sabha, as per Article 75."
  ),
  QuestionQuiz(
    "57. Under which Article can the President of India appoint Judges of the High Courts?",
    [
      "Article 124",
      "Article 217",
      "Article 124A",
      "Article 222"
    ],
    "Article 217",
    "The President of India appoints judges to the High Courts under Article 217, based on the recommendations of the Chief Justice of India and the respective state's Governor."
  ),
  QuestionQuiz(
    "58. What is the President's role in the election of the Vice President of India?",
    [
      "The President appoints the Vice President",
      "The President oversees the election process",
      "The President can veto the election of the Vice President",
      "The President has no role"
    ],
    "The President oversees the election process",
    "The President of India has a formal role in overseeing the election of the Vice President, but the election is conducted by the Electoral College."
  ),
  QuestionQuiz(
    "59. What happens if the President of India refuses to sign a bill?",
    [
      "The bill is automatically rejected",
      "The bill goes back to Parliament for reconsideration",
      "The President can send it to the Supreme Court",
      "The bill becomes law without the President’s signature"
    ],
    "The bill goes back to Parliament for reconsideration",
    "If the President refuses to sign a bill, they can return it to Parliament for reconsideration under Article 111."
  ),
  QuestionQuiz(
    "60. Can the President of India remove a Member of Parliament?",
    [
      "Yes, for misconduct",
      "Yes, if they break the law",
      "No, only Parliament can remove a member",
      "No, the President has no such power"
    ],
    "No, only Parliament can remove a member",
    "The President of India does not have the power to remove a Member of Parliament. Only Parliament can disqualify its members under the provisions of the Constitution."
  ),

  QuestionQuiz(
    "61. Under which Article can the President of India issue a Proclamation of Emergency?",
    [
      "Article 352",
      "Article 370",
      "Article 124",
      "Article 72"
    ],
    "Article 352",
    "The President can issue a Proclamation of Emergency under Article 352, when the security of India or any part of it is threatened by war, external aggression, or armed rebellion."
  ),
  QuestionQuiz(
    "62. Which of the following can be a ground for the President of India to use their veto power?",
    [
      "Unconstitutional laws",
      "Bills violating fundamental rights",
      "Bills passed by the Cabinet without due process",
      "All of the above"
    ],
    "All of the above",
    "The President of India has the power to use their veto power to reject bills, particularly if they are unconstitutional, violate fundamental rights, or passed improperly."
  ),
  QuestionQuiz(
    "63. Who determines the salary of the President of India?",
    [
      "The Parliament",
      "The Prime Minister",
      "The Speaker of the Lok Sabha",
      "The Finance Minister"
    ],
    "The Parliament",
    "The salary and allowances of the President of India are determined by the Parliament, as per Article 59."
  ),
  QuestionQuiz(
    "64. Under which Article does the President of India have the power to grant pardons, reprieves, respites, or remissions of punishment?",
    [
      "Article 72",
      "Article 61",
      "Article 74",
      "Article 123"
    ],
    "Article 72",
    "Article 72 grants the President of India the power to grant pardons, reprieves, respites, or remissions of punishment, particularly in cases of offences against the Union law."
  ),
  QuestionQuiz(
    "65. Who is the ultimate custodian of the Constitution of India?",
    [
      "The President",
      "The Prime Minister",
      "The Chief Justice of India",
      "The Parliament"
    ],
    "The President",
    "The President of India is the ultimate custodian of the Constitution, responsible for upholding and protecting it under their oath of office as per Article 60."
  ),
  QuestionQuiz(
    "66. Which of the following is NOT a discretionary power of the President of India?",
    [
      "Dissolving the Lok Sabha",
      "Appointing the Prime Minister",
      "Granting pardons in certain cases",
      "Declaring a national emergency"
    ],
    "Declaring a national emergency",
    "The President's power to declare a national emergency under Article 352 is not a discretionary power; it must be based on the Cabinet's advice."
  ),
  QuestionQuiz(
    "67. Which of the following is the President's role in the state legislature?",
    [
      "The President can dissolve the state assembly",
      "The President can approve state laws",
      "The President nominates members to the state legislature",
      "The President can pass laws at the state level"
    ],
    "The President can approve state laws",
    "The President of India must approve bills passed by state legislatures before they can become laws, as stated in Article 200."
  ),
  QuestionQuiz(
    "68. What is the role of the President in the appointment of the Attorney General of India?",
    [
      "The President directly appoints the Attorney General",
      "The President appoints the Attorney General based on the advice of the Prime Minister",
      "The President nominates candidates for the post",
      "The Attorney General is elected by the people"
    ],
    "The President directly appoints the Attorney General",
    "The Attorney General of India is appointed by the President under Article 76, and serves as the chief legal advisor to the government."
  ),
  QuestionQuiz(
    "69. Under which Article can the President of India exercise his powers to form new states or alter boundaries?",
    [
      "Article 3",
      "Article 365",
      "Article 123",
      "Article 368"
    ],
    "Article 3",
    "Under Article 3, the President of India has the power to form new states, alter the boundaries of existing states, or change their names after receiving resolutions from the Parliament."
  ),
  QuestionQuiz(
    "70. Who takes the oath of office before the President of India?",
    [
      "The Vice President",
      "The Chief Justice of India",
      "The Prime Minister",
      "The Speaker of the Lok Sabha"
    ],
    "The Chief Justice of India",
    "The President of India takes the oath of office before the Chief Justice of India, as per Article 60."
  ),
  QuestionQuiz(
    "71. What is the maximum time gap between two sessions of Parliament as per the President's powers?",
    [
      "6 months",
      "3 months",
      "4 months",
      "1 year"
    ],
    "6 months",
    "According to Article 85, the President can prorogue Parliament or dissolve the Lok Sabha, ensuring that no more than 6 months pass between two sessions of Parliament."
  ),
  QuestionQuiz(
    "72. What is the role of the President in a hung Parliament situation?",
    [
      "The President can appoint a Prime Minister from the largest party",
      "The President can dissolve the Parliament immediately",
      "The President can invite any party to form the government",
      "The President can declare a national emergency"
    ],
    "The President can invite any party to form the government",
    "In a hung Parliament, the President of India has the discretion to invite the largest party or a coalition to form the government."
  ),
  QuestionQuiz(
    "73. How can the President of India act on the advice of the Council of Ministers?",
    [
      "The President must accept the advice",
      "The President can reject the advice",
      "The President can seek clarification from Parliament",
      "The President can implement the advice immediately"
    ],
    "The President must accept the advice",
    "As per Article 74, the President is bound by the advice of the Council of Ministers headed by the Prime Minister, except in matters of discretion."
  ),
  QuestionQuiz(
    "74. Which of the following is NOT a function of the President of India?",
    [
      "Signing bills into law",
      "Appointing the Governor of a state",
      "Issuing a writ of habeas corpus",
      "Issuing ordinances during Parliament recess"
    ],
    "Issuing a writ of habeas corpus",
    "Issuing a writ of habeas corpus is not a function of the President of India. It is a judicial function, typically exercised by the courts."
  ),
  QuestionQuiz(
    "75. Can the President of India act in their personal discretion?",
    [
      "Yes, in matters not involving the Cabinet",
      "No, the President must always act on the advice of the Prime Minister",
      "Yes, in all matters",
      "No, the President cannot act on their discretion"
    ],
    "Yes, in matters not involving the Cabinet",
    "The President of India can act in their discretion in certain matters, such as appointing the Prime Minister when no party has a clear majority, as per the Constitution."
  ),
  QuestionQuiz(
    "76. What is the significance of the President's oath of office?",
    [
      "It ensures the President will act without bias",
      "It makes the President the head of the judiciary",
      "It confirms the President will uphold the Constitution",
      "It empowers the President to govern independently"
    ],
    "It confirms the President will uphold the Constitution",
    "The President’s oath of office, as prescribed in Article 60, requires them to preserve, protect, and defend the Constitution of India."
  ),
  QuestionQuiz(
    "77. Which of the following statements about the President's power to grant pardons is true?",
    [
      "The President can grant pardons for any offence",
      "The President can grant pardons only in cases of sentences imposed by courts",
      "The President cannot grant pardons in cases of death sentences",
      "The President can only pardon crimes under state law"
    ],
    "The President can grant pardons only in cases of sentences imposed by courts",
    "The President has the power to grant pardons, reprieves, and remissions for offences against Union law, especially in death sentence cases under Article 72."
  ),
  QuestionQuiz(
    "78. Which of the following actions can the President take if the government fails to secure a majority in the Lok Sabha?",
    [
      "Dissolve the Lok Sabha immediately",
      "Ask the Prime Minister to resign",
      "Ask the largest party to form the government",
      "Order fresh elections"
    ],
    "Ask the largest party to form the government",
    "In the case of a hung Parliament, the President can invite the largest party or coalition to form the government, ensuring a functioning majority."
  ),

    QuestionQuiz(
    "79. What is the role of the President in the appointment of the Comptroller and Auditor General of India?",
    [
      "The President directly appoints the CAG",
      "The President appoints the CAG on the advice of the Finance Minister",
      "The President nominates candidates for the CAG",
      "The Parliament elects the CAG"
    ],
    "The President directly appoints the CAG",
    "The Comptroller and Auditor General (CAG) of India is appointed by the President under Article 148, based on the recommendations of the committee of the Parliament."
  ),
  QuestionQuiz(
    "80. Under which Article can the President of India declare a Financial Emergency?",
    [
      "Article 360",
      "Article 352",
      "Article 370",
      "Article 123"
    ],
    "Article 360",
    "Under Article 360, the President of India can declare a Financial Emergency if the financial stability or credit of India is threatened."
  ),
  QuestionQuiz(
    "81. Who advises the President of India on the subject of defense?",
    [
      "The Defense Minister",
      "The Chief of Army Staff",
      "The Council of Ministers",
      "The Vice President"
    ],
    "The Defense Minister",
    "The President of India is advised by the Defense Minister and the Council of Ministers on matters relating to defense and armed forces."
  ),
  QuestionQuiz(
    "82. What is the President's role in the proclamation of Ordinances?",
    [
      "The President can issue an Ordinance if the Parliament is not in session",
      "The President can issue an Ordinance only with the approval of the Prime Minister",
      "The President can issue an Ordinance anytime without conditions",
      "The President cannot issue Ordinances"
    ],
    "The President can issue an Ordinance if the Parliament is not in session",
    "As per Article 123, the President of India can promulgate Ordinances to make laws during the recess of Parliament when immediate legislative action is required."
  ),
  QuestionQuiz(
    "83. Which of the following is a discretionary power of the President of India?",
    [
      "To appoint the Prime Minister",
      "To form a new state",
      "To accept the advice of the Council of Ministers",
      "To dismiss the Council of Ministers"
    ],
    "To dismiss the Council of Ministers",
    "The President has the discretionary power to dismiss the Council of Ministers, especially when they are unable to command the confidence of the Lok Sabha."
  ),
  QuestionQuiz(
    "84. Which of the following powers does the President of India exercise directly without the aid of the Council of Ministers?",
    [
      "Appointment of Governors",
      "Dissolution of the Lok Sabha",
      "Granting pardons in criminal cases",
      "Issuing Ordinances"
    ],
    "Granting pardons in criminal cases",
    "The President of India can directly exercise the power of granting pardons, reprieves, or remissions of punishment, particularly in death sentence cases, under Article 72."
  ),
  QuestionQuiz(
    "85. What is the power of the President to promulgate ordinances during Parliament recess?",
    [
      "The President can promulgate ordinances in the absence of Parliament",
      "The President must wait for Parliament to reconvene",
      "The President can only issue ordinances on the advice of the Prime Minister",
      "The President has no power to issue ordinances"
    ],
    "The President can promulgate ordinances in the absence of Parliament",
    "The President has the power to issue ordinances to make laws during the recess of Parliament under Article 123, when urgent legislation is required."
  ),
  QuestionQuiz(
    "86. Who advises the President of India on the matters relating to foreign affairs?",
    [
      "The Prime Minister",
      "The Foreign Minister",
      "The Council of Ministers",
      "The Vice President"
    ],
    "The Foreign Minister",
    "The President of India is advised on foreign affairs by the Foreign Minister, as part of the Council of Ministers under Article 74."
  ),
  QuestionQuiz(
    "87. What is the role of the President in the process of impeachment?",
    [
      "The President can initiate the impeachment process",
      "The President can preside over the impeachment proceedings",
      "The President can grant a pardon after impeachment",
      "The President can only suspend the impeachment process"
    ],
    "The President can preside over the impeachment proceedings",
    "The President of India does not initiate or preside over their own impeachment. However, the President must sign the impeachment order after the Parliament passes the resolution."
  ),
  QuestionQuiz(
    "88. Which Article of the Constitution deals with the power of the President to promulgate ordinances?",
    [
      "Article 123",
      "Article 74",
      "Article 352",
      "Article 368"
    ],
    "Article 123",
    "Article 123 gives the President the power to promulgate ordinances when the Parliament is not in session and when immediate legislative action is required."
  ),
  QuestionQuiz(
    "89. Which of the following is the responsibility of the President in the event of the dissolution of the Lok Sabha?",
    [
      "To call for elections to the Lok Sabha",
      "To appoint a new Cabinet",
      "To appoint a new Prime Minister",
      "To issue a fresh Ordinance"
    ],
    "To call for elections to the Lok Sabha",
    "When the Lok Sabha is dissolved, it is the responsibility of the President to call for general elections and set the date for the same."
  ),
  QuestionQuiz(
    "90. What is the role of the President in the process of the Presidential Address to the Parliament?",
    [
      "The President addresses the Parliament after the general elections",
      "The President delivers the Address at the beginning of each new session of Parliament",
      "The President addresses the Parliament only once during their tenure",
      "The President can skip addressing the Parliament"
    ],
    "The President delivers the Address at the beginning of each new session of Parliament",
    "The President of India addresses a joint session of Parliament at the commencement of the first session of each year, outlining the government's agenda and policies."
  ),
  QuestionQuiz(
    "91. How long can the President of India remain in office if the election process is delayed?",
    [
      "For a maximum of 6 months",
      "For a maximum of 1 year",
      "Until the next President is elected",
      "For a maximum of 3 months"
    ],
    "Until the next President is elected",
    "If the election process is delayed, the President of India can remain in office until a new President is elected, as per the provisions of the Constitution."
  ),
  QuestionQuiz(
    "92. What is the President's role in relation to the Union Territory of Jammu & Kashmir?",
    [
      "The President is the Head of the Union Territory",
      "The President can make laws for the Union Territory",
      "The President appoints the Chief Minister of Jammu & Kashmir",
      "The President has no role in Jammu & Kashmir governance"
    ],
    "The President can make laws for the Union Territory",
    "As per the provisions of the Constitution, the President has the power to make laws for Union Territories like Jammu & Kashmir, particularly after its reorganization in 2019."
  ),

    QuestionQuiz(
    "93. What is the President's role in the appointment of the Chief Election Commissioner of India?",
    [
      "The President directly appoints the Chief Election Commissioner",
      "The President appoints the Chief Election Commissioner based on recommendations of the Prime Minister",
      "The President appoints the Chief Election Commissioner on the advice of the Council of Ministers",
      "The President has no role in the appointment"
    ],
    "The President directly appoints the Chief Election Commissioner",
    "The Chief Election Commissioner of India is appointed by the President of India, as per Article 324 of the Constitution."
  ),
  QuestionQuiz(
    "94. Under which Article can the President of India declare a State of Emergency?",
    [
      "Article 352",
      "Article 360",
      "Article 370",
      "Article 352 and 360"
    ],
    "Article 352",
    "Article 352 empowers the President of India to declare a State of Emergency in case of threats to the national security due to war, external aggression, or armed rebellion."
  ),
  QuestionQuiz(
    "95. What is the process of removing the President from office?",
    [
      "Impeachment by the Parliament",
      "Resignation of the President",
      "Decision by the Supreme Court",
      "The Vice President acts as President"
    ],
    "Impeachment by the Parliament",
    "The President of India can be removed from office through the process of impeachment for violation of the Constitution, as per Article 61 of the Constitution."
  ),
  QuestionQuiz(
    "96. What is the President's role in the appointment of Judges of the Supreme Court?",
    [
      "The President appoints the Judges of the Supreme Court directly",
      "The President appoints Judges in consultation with the Chief Justice of India",
      "The President appoints Judges based on the recommendations of the Prime Minister",
      "The President has no role in the appointment of Judges"
    ],
    "The President appoints the Judges of the Supreme Court directly",
    "Under the Constitution, the President of India appoints Judges of the Supreme Court after consulting the Chief Justice of India."
  ),
  QuestionQuiz(
    "97. How can the President exercise their power to dissolve the Lok Sabha?",
    [
      "By issuing an ordinance",
      "On the advice of the Prime Minister",
      "At their discretion, without any advice",
      "Only after consulting the Chief Justice"
    ],
    "On the advice of the Prime Minister",
    "The President of India dissolves the Lok Sabha on the advice of the Prime Minister, who is responsible for the Lok Sabha's functioning."
  ),
  QuestionQuiz(
    "98. What is the President's role in granting clemency to convicts?",
    [
      "The President can grant clemency, reprieve, or pardon",
      "The President can only commute sentences",
      "The President can reduce sentences but not grant pardons",
      "The President can only remit sentences"
    ],
    "The President can grant clemency, reprieve, or pardon",
    "As per Article 72, the President of India has the power to grant pardons, reprieves, respites, or remissions of punishment or to suspend, remit, or commute sentences of any individual."
  ),
  QuestionQuiz(
    "99. Can the President of India dissolve the Rajya Sabha?",
    [
      "Yes, the President can dissolve the Rajya Sabha",
      "No, the President cannot dissolve the Rajya Sabha",
      "The President can dissolve the Rajya Sabha only in case of national emergency",
      "The President can dissolve the Rajya Sabha on the advice of the Prime Minister"
    ],
    "No, the President cannot dissolve the Rajya Sabha",
    "The President of India cannot dissolve the Rajya Sabha. The Rajya Sabha is a permanent body, and its members are not elected for a fixed term, unlike the Lok Sabha."
  ),
  QuestionQuiz(
    "100. What is the role of the President in the appointment of Governors in Indian states?",
    [
      "The President directly appoints the Governors",
      "The President appoints Governors on the advice of the Chief Minister of each state",
      "The President appoints Governors on the advice of the Union Home Minister",
      "The President has no role in the appointment of Governors"
    ],
    "The President directly appoints the Governors",
    "Under Article 155 of the Constitution, the President of India appoints the Governors of the States."
  ),

];




List<QuizQuestion> get<QuizQuestion>(List<QuizQuestion> ques,int n) {
  final random = Random();
  final Set<int> indices = {}; 

  while (indices.length < n && indices.length < ques.length) {
    indices.add(random.nextInt(ques.length));
  }

  return indices.map((index) => ques[index]).toList();
}