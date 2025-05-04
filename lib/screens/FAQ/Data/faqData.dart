class FaqData {
  List<Map<String, dynamic>> FAQsAndAnswers = [
    {
      "platform": "Collection Manager",
      "subjects": [
        {
          "subject": "User Management",
          "faqs": [
            {
              "question": "How do I add a new collector to the system?",
              "answer":
                  "Navigate to the Collectors section, click the “+” icon, and fill in the required details such as name, mobile, and email. Assign them to a service office and save to complete the setup."
            },
            {
              "question":
                  "Can I deactivate a collector without deleting their data?",
              "answer":
                  "Yes. You can mark a collector as inactive by editing their profile and toggling the \“Active\” switch off. Their job history will still remain accessible."
            },
            {
              "question":
                  " What happens if a collector is unavailable during a scheduled job?",
              "answer":
                  " If a collector marks themselves as unavailable, the job will appear flagged in the admin view. You will be prompted to reassign a different available collector."
            }
          ]
        },
        {
          "subject": "Collection Reports",
          "faqs": [
            {
              "question": "How are collection reports submitted by collectors?",
              "answer":
                  "Collectors can submit batch results through the Collection Reports section of the app. The status will update in real time to indicate successful submission or errors."
            },
            {
              "question": "What does \“Send by Collector\” mean in reports?",
              "answer":
                  "This status means the report has not yet been submitted. It is pending action from the assigned collector to complete and send the report."
            }
          ]
        }
      ]
    },
    {
      "platform": "Work Assist",
      "subjects": [
        {
          "subject": "Subject C",
          "faqs": [
            {
              "question": "How to enable dark mode?",
              "answer": "Go to settings and enable dark mode."
            },
            {
              "question": "Can I use offline mode?",
              "answer": "Yes, you can enable offline mode under ..."
            }
          ]
        }
      ]
    }
  ];
}
