import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Color(0xFF1a1a1a)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 28),
                ),

                const SizedBox(height: 20),

                // Title
                const Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                // Terms content (scrollable)
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildSection(
                          '''Στο πλαίσιο της προωθητικής ενέργειας με τίτλο “adidas @ primer music festival 2025” της Διοργανώτριας Εταιρείας «Savvy Partners μονοπρόσωπη ΙΚΕ» (εφεξής η «Εκδήλωση») φωτογραφήθηκα στο photobooth, κυριότητας και διαχείρισης της εταιρείας “Α. ΑΛΕΞΑΝΔΡΑΚΗΣ – Κ.ΒΛΑΜΟΣ Ο.Ε“ και διακριτικό τίτλο RUSH EVENTS”, η οποία εδρεύει στη Γλυφάδα Αττικής, οδός Βορείου Ηπείρου, αρ. 27 (εφεξής η «RUSH EVENTS»).
Δηλώνω ότι έχω συμπληρώσει το 15ο έτος της ηλικίας μου και παρέχω την συγκατάθεση μου στη RUSH EVENTS, ώστε να ληφθεί η φωτογραφία μου από το μηχάνημα photobooth και να αποθηκευτεί στη βάση δεδομένων που διαχειρίζεται η RUSH EVENTS, ώστε να μου σταλεί ηλεκτρονικό αντίγραφο, μέσω ηλεκτρονικού ταχυδρομείου στην διεύθυνση που κοινοποίησα στην “RUSH EVENTS”, που ενεργεί ως Υπεύθυνος Επεξεργασίας. Η επεξεργασία πραγματοποιείται με βάση τη συγκατάθεσή μου (αρ. 6 παρ. 1α του ΓΚΠΔ).
Δηλώνω επίσης ότι έχω ενημερωθεί και συγκατατίθεμαι στη χρήση αυτοματοποιημένων εργαλείων επεξεργασίας εικόνας, συμπεριλαμβανομένων εργαλείων τεχνητής νοημοσύνης (AI εργαλεία), τα οποία χρησιμοποιούνται από την “RUSH EVENTS” αποκλειστικά για την τεχνική βελτίωση ή αισθητική επεξεργασία της φωτογραφίας μου (όπως π.χ. προσαρμογή φωτισμού, εφαρμογή φίλτρων, σταθεροποίηση εικόνας, ή αλλαγή φόντου). Έχω ενημερωθεί ότι τα AI εργαλεία δεν αποθηκεύουν και δεν αναλύουν περαιτέρω προσωπικά μου δεδομένα πέραν της άμεσης τεχνικής χρήσης για την παραγωγή και αποστολή της τελικής φωτογραφίας και ότι δεν προκύπτει εξαγωγή ή καταγραφή βιομετρικών δεδομένων από την εικόνα μου.Η χρήση των εν λόγω εργαλείων πραγματοποιείται με βάση τη συγκατάθεσή μου (αρ. 6 παρ. 1α του ΓΚΠΔ). 
Έχω επίσης ενημερωθεί ότι για τον σκοπό εκπλήρωσης των παραπάνω, η RUSH EVENTS επεξεργάζεται ακόμη τα στοιχεία που της έδωσα κατά τη συμμετοχή μου στη φωτογράφιση στο photobooth (διεύθυνση ηλεκτρονικού ταχυδρομείου, ονοματεπώνυμο). Η επεξεργασία πραγματοποιείται στη βάση της ‘εκπλήρωσης σύμβασης’ (αρ. 6 παρ. 1β του ΓΚΠΔ). 
Η συγκατάθεσή δίνεται αφού ενημερώθηκα ότι τα προσωπικά στοιχεία που δηλώνω και η φωτογραφία μου στην οποία απεικονίζομαι,  θα διατηρηθούν από την “RUSH EVENTS” σε βάση δεδομένων με σκοπό την διεκπεραίωση της παρούσας εντολής μου και μέχρι την ολοκλήρωση του προωθητικού προγράμματος/της εκδήλωσης ήτοι την 09/09/2025. 
Έχω ενημερωθεί ότι η εταιρεία “RUSH EVENTS” δηλώνει και εγγυάται ότι δεν θα χρησιμοποιήσει τα δεδομένα που έχει συλλέξει παρά μόνο  για τον σκοπό της αποστολής της φωτογραφίας στην ηλεκτρονική μου διεύθυνση και δεν θα μεταβιβάσει κανένα προσωπικό μου δεδομένο σε τρίτους για οποιοδήποτε σκοπό. Μετά το πέρας της ως άνω ημερομηνίας, όλα τα προσωπικά δεδομένα που καταχωρήθηκαν και αποθηκευτήκαν προσωρινά,  θα διαγραφούν οριστικά από την “RUSH EVENTS”, χωρίς δικαίωμα επανάκτησης. 
Καθ’ όλη τη διάρκεια της επεξεργασίας, έχω ενημερωθεί ότι δικαιούμαι:  (α) να υποβάλω γραπτό αίτημα στην “RUSH EVENTS” που θα απευθύνω στον Αλεξανδράκη Αντώνη,  (β) μέσω email, στην διεύθυνσή info@thephotobooth.gr,  (γ) μέσω ταχυδρομικής επιστολής, στην Οδό Βορείου Ηπείρου 27, Άνω Γλυφάδα, 16562, ή τηλεφωνικά στο210 9621193,   για (i) πρόσβαση στα προσωπικά μου δεδομένα, (ii) διόρθωση των προσωπικών μου δεδομένων, (iii) διαγραφή των προσωπικών μου δεδομένων, (iv) περιορισμό, αντίταξη/εναντίωση στην επεξεργασία των προσωπικών μου δεδομένων, (v) φορητότητα των προσωπικών μου δεδομένων, (vi) ανάκληση της συγκατάθεσής μου αναφορικά με την επεξεργασία των προσωπικών μου δεδομένων.
Περαιτέρω, έχω ενημερωθεί ότι δικαιούμαι να υποβάλλω καταγγελία ενώπιον της Αρχής Προστασίας Δεδομένων Προσωπικού Χαρακτήρα (Λ.Κηφισίας 1-3, Τ.Κ. 11523, Αθήνα τηλ: +30 210 6475600 e-mail: contact@dpa.gr
Δηλώνω ότι τα πρόσωπα που απεικονίζονται μαζί μου στη φωτογραφία έχουν ενημερωθεί για όλα τα παραπάνω και έχουν παράσχει επίσης ρητή συγκατάθεσή τους, ώστε να τύχει επεξεργασίας η εικόνα τους σύμφωνα με τα παραπάνω και να αποσταλεί η φωτογραφία στο παραπάνω email.''',
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                // Accept button
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'I UNDERSTAND',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.5,
              //a font that supports greek characters
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
