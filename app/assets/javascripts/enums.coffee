App.Enums = 
  AcademicInstitutions: _.map [
    'אוניברסיטת בן גוריון בנגב'
    'אוניברסיטת בר אילן'
    'אוניברסיטת חיפה'
    'אוניברסיטת תל אביב'
    'האוניברסיטה העברית בירושלים'
    'האוניברסיטה הפתוחה'
    'הטכניון מכון טכנולוגי לישראל'
    'מכון ויצמן למדע'
    'אפקה המכללה האקדמית להנדסה בתל אביב  '
    'בית הספר הגבוה לטכנולוגיה בירושלים'
    'בצלאל אקדמיה לעיצוב ואומנות ירושלים'
    'האקדמיה למוסיקה ולמחול בירושלים'
    'המוסד האקדמי נצרת'
    'המכללה האקדמית אחווה'
    'המכללה האקדמית אשקלון'
    'המכללה האקדמית גליל מערבי'
    'המכללה האקדמית הדסה ירושלים'
    'המכללה האקדמית כנרת בעמק הירדן'
    'המכללה האקדמית להנדסה אורט ע"ש בראודה'
    'המכללה האקדמית להנדסה וטכנולוגיה אורט הרמלין'
    'המכללה האקדמית להנדסה ירושלים'
    'המכללה האקדמית להנדסה סמי שמעון'
    'המכללה האקדמית לחברה ואמנויות'
    'המכללה האקדמית לישראל ברמת גן חל"צ'
    'המכללה האקדמית נתניה'
    'המכללה האקדמית ספיר'
    'המכללה האקדמית עמק יזרעאל ע"ש מקס שטרן'
    'המכללה האקדמית צפת'
    'המכללה האקדמית של תל אביב יפו'
    'המכללה האקדמית תל חי'
    'המסלול האקדמי של המכללה למינהל'
    'המרכז האוניברסיטאי אריאל בשומרון'
    'המרכז האקדמי כרמל'
    'המרכז האקדמי למשפט ועסקים'
    'המרכז האקדמי פרס'
    'המרכז האקדמי רופין'
    'המרכז הבינתחומי בהרצליה'
    'המרכז ללימודים אקדמיים באור יהודה'
    'הקריה האקדמית קרית אונו'
    'מכון טכנולוגי חולון'
    'מכון לנדר מרכז אקדמי ירושלים'
    'מכון שכטר למדעי היהדות'
    'מכללת שערי משפט המכללה ללימודי משפט'
    'מרכז אקדמי דן'
    'שנקר בית ספר גבוה להנדסה ולעיצוב'
    '"אמונה" המכללה אקדמית להוראת האמנות ולחינוך,'
    '"חמדת הדרום" מכללה התורנית לחינוך'
    '"אורות ישראל"'
    'אוהלו המכללה לחינוך לתיירות ולספורט בקצרין'
    'אלקאסמי מכללה אקדמית לחינוך'
    'המכללה האקדמית בית ברל )כולל המכון להכשרת מורים ערבים('
    'המכללה האקדמית הדתית לחינוך ליפשיץ'
    'המכללה האקדמית הערבית לחינוך בישראל'
    'המכללה האקדמית לחינוך "תלפיות"'
    'המכללה האקדמית לחינוך גבעת וושינגטון'
    'המכללה האקדמית לחינוך ע"ש קיי'
    'המכללה להוראת הטכנולוגיה מיסודה של המכללה למינהל'
    'המכללה לחינוך גופני ולספורט ע"ש זינמן במכון וינגייט'
    'המכללה לחינוך ע"ש א. ד. גורדון'
    'המכללה לחינוך ע"ש דוד ילין'
    'המרכז האקדמי לעיצוב ולחינוך ויצו חיפה ע"ש נרי בלומפילד'
    'מכללה אקדמית לחינוך "אורנים"'
    'מכללה ירושלים'
    'מכללת יעקב הרצוג )ליד ישיבת הר עציון('
    'מכללת לוינסקי לחינוך )כולל המדרשה למוסיקה('
    'מכללת סכנין להכשרת עובדי הוראה'
    'סמינר הקיבוצים המכללה לחינוך לטכנולוגיה ולאומנויות'
    'שאנן המכללה האקדמית הדתית לחינוך  '
    'המכללה האקדמית צפת באחריות אוניברסיטת בר אילן'
    'המכללה האקדמית אשקלון באחריות אוניברסיטת בר אילן'
    'המכללה האקדמית כנרת בעמק הירדן באחריות אוניברסיטת בר אילן'
    'המכללה האקדמית גליל מערבי באחריות אוניברסיטת בר אילן'
  ], (item, index) -> text: item, value: index + 1

  AcademicDegrees: _.map [
    'מדעי המחשב'
    'מדעי בחרה'
    'מדעי החיים'
    'מדעים מדוייקים'
    'עבודה סוציאלית'
  ], (item, index) -> text: item, value: index + 1

  SpecialCities: _.map [
    'אביבים'
    'אבירים'
    'אבן מנחם'
    'אדמית'
    'אור הגנוז'
    'אילון'
    'אלקוש'
    'בית הלל'
    'ברעם'
    'בצת'
    'בר יוחאי'
    'גורן'
    'גוש חלב'
    'געתון'
    'גרנות הגליל'
    'גשר הזיו'
    'דובב'
    'דישון'
    'דלתון'
    'דן'
    'דפנה'
    'הגושרים'
    'הילה'
    'זיו הגליל'
    'זרעית'
    'חוסן'
    'חניתה'
    'חורפיש'
    'יערה'
    'יפתח'
    'יראון'
    'כברי'
    'כפר בלום'
    'כפר גלעדי'
    'כפר יובל'
    'כפר סאלד'
    'כרם בן זמרה'
    'לימן'
    'מטולה'
    'מירון'
    'מלכיה'
    'מנות'
    'מנרה'
    'מעונה'
    'מעיליה'
    'מעין ברוך'
    'מעלות תרשיחא'
    'מצובה'
    'מרגליות'
    'משגב עם'
    'מתת'
    'נאות מרדכי'
    'נהריה'
    'נטועה'
    'סאסא'
    'סער'
    'ספסופה'
    'עבדון'
    'עין יעקב'
    'עלמה'
    'עמיר'
    'עראמשה'
    'פאסוטה'
    'פקיעין'
    'פקיעין החדשה'
    'צבעון'
    'צוריאל'
    'ראג\'ר'
    'ראש הנקרה'
    'ריחניה'
    'רמות נפתלי'
    'שאר ישוב'
    'שדה אליעזר'
    'שדה נחמיה'
    'שומרה'
    'שלומי'
    'שמיר'
    'שניר'
    'שתולה'
  ], (item, index) -> text: item, value: index + 1

  DonationInstitutions: _.map [
    'a'
    'b'
    'c'
  ], (item, index) -> text: item, value: index + 1