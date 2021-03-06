

class App.Views.PersonalOverviewSection extends App.Views.Section

  id: 'personal-overview-section'
  templateName: 'personal_overview'

  render: ->
    super
    ac = ->
      $('#occupation').autocomplete
        max: 10
        source: [
          "אגרונום"
          "אגרונומוס"
          "אדריכל"
          "אומן"
          "אופה"
          "אחות"
          "אינטנדנט"
          "אלקטרונאי"
          "אמן (אמנות)"
          "אנתרופולוג"
          "אקטואר"
          "ארכאולוג"
          "ביולוג"
          "במאי"
          "ג'ודוקא"
          "גאוגרף"
          "גאולוג"
          "גופר"
          "גיטריסט"
          "גרפולוג"
          "גשש"
          "דוגמנות"
          "דוקטור"
          "די ג'יי"
          "דייל אוויר"
          "דיפלומט"
          "דרוג"
          "הגאי"
          "הומוריסטן"
          "היסטוריון"
          "הכוונה לבחירת מקצוע"
          "וטרינר"
          "זמר"
          "זנות"
          "חזנות"
          "חידונאי"
          "חייל"
          "חשפנות"
          "טייס"
          "טכנאי קול"
          "יועץ השקעות"
          "יועץ מס"
          "כימאי"
          "כירורג"
          "כלבנות"
          "כלכלן"
          "כרוז"
          "כתב (מקצוע)"
          "לבורנט"
          "ליצן"
          "מגיה"
          "מדינאי"
          "מהנדס"
          "מהנדס מחשבים"
          "מהנדס מכונות"
          "מהנדס עיר"
          "מהנדס תעשייה וניהול"
          "מוביל הרכב"
          "מודל (אמנות)"
          "מוהל"
          "מורה"
          "מחזאי"
          "מידענות"
          "מכוון פסנתרים"
          "מכשפה"
          "מלווה בריבית"
          "ממציא"
          "מנהל חשבונות"
          "מעצב תעשייתי"
          "מפיק"
          "מפיק מוזיקלי"
          "מציל"
          "מקצועות"
          "מרגל"
          "מרצה"
          "משורר"
          "משפטן"
          "מתורגמן"
          "מתכנת"
          "מתמטיקאי"
          "מתרגם"
          "נוטריון"
          "נוירופסיכולוג"
          "ניצוח"
          "סופר"
          "סופר סת''ם"
          "סוציולוג"
          "סטטיסטיקאי"
          "סייעת לרופא שיניים"
          "סילוק פצצות"
          "סיעוד"
          "ספורטאי"
          "ספן"
          "ספרן"
          "סקסופוניסט"
          "עובד סוציאלי"
          "עורך דין"
          "עיתונאי"
          "פוליטיקאי"
          "פוסטדוקטורט"
          "פוסק"
          "פושע"
          "פזמונאי"
          "פיזיקאי"
          "פילוסוף"
          "פלס"
          "פסיכואנליטיקאי"
          "פסיכולוג"
          "פסיכיאטר"
          "פסל (מקצוע)"
          "פסנתרן"
          "פרופסור"
          "צבע (מקצוע)"
          "צוללן"
          "צייר"
          "צלם (מקצוע)"
          "צנחן"
          "קומיקאי"
          "קוסם"
          "קלינאי תקשורת"
          "קלע סער"
          "קריין"
          "קרימינולוג"
          "קריקטוריסט"
          "רב"
          "רב חובל"
          "רואה חשבון"
          "רופא"
          "רוצח שכיר"
          "ריפוי בעיסוק"
          "רעיונאי"
          "שגריר"
          "שופט"
          "שופט (ספורט)"
          "שופט כדורגל"
          "שחקן"
          "שחקן (ספורט)"
          "שחקן כדורגל"
          "שחקן כדורסל"
          "שכיר חרב"
          "שמאי (מקצוע)"
          "שמאי מקרקעין"
          "שף"
          "תארים רבניים"
          "תסריטאי"
        ]
    _.delay ac, 200
    this