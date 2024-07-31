import 'package:dars_69/data/book/book.dart';
import 'package:dars_69/services/book_services.dart';

class BookRepository {
  final BookServices _services = BookServices();

  List<Book> _books = [
    Book(
      title: "Harry Potter PDF",
      author: "Joanne Rowling",
      url:
          "https://vidyaprabodhinicollege.edu.in/VPCCECM/ebooks/ENGLISH%20LITERATURE/Harry%20potter/(Book%207)%20Harry%20Potter%20And%20The%20Deathly%20Hallows.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "O‘tgan kunlar",
      author: "Abdulla Qodiriy",
      url:
      "https://zakm.uz/media/books/Bahodir_Karim._Otkan_kunlar_ibrati.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "Mehrobdan chayon",
      author: "Abdulla Qodiriy",
      url:
      "https://library.navoiy-uni.uz/files/abdulla%20qodiriy_%20mehrobdan%20chayon.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "Dunyoning ishlari",
      author: "O'tkir Hoshimov",
      url:
      "https://elib.buxdupi.uz/books/O%E2%80%98tkir%20Hoshimov-Dunyoning%20ishlari.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "Tushda kechgan umrlar",
      author: "Muhammaf Yusuf",
      url:
      "https://www.sever.be/files/BADIIY%20KITOBLAR/Tushda%20kechgan%20umrlar.%20Utkir%20Hoshimov.%20Roman.Toshkent%202019..pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "Yulduzli tunlar",
      author: "Pirimqul Qodirov",
      url:
      "https://library.navoiy-uni.uz/files/yulduzli_tunlar_ziyouz_com.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "Lolazor",
      author: "Asqad Muxtor",
      url:
      "https://n.ziyouz.com/books/uzbek_nasri/Murod%20Muhammad%20Do'st.%20Lolazor%20(roman).pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "Moby-Dick",
      author: "Herman Melville",
      url:
      "https://uberty.org/wp-content/uploads/2015/12/herman-melville-moby-dick.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "1984",
      author: 'George Orwell',
      url:
      "https://rauterberg.employee.id.tue.nl/lecturenotes/DDM110%20CAS/Orwell-1949%201984.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    Book(
      title: "The Great Gatsby",
      author: 'F. Scott Fitzgerald',
      url:
      "https://www.planetebook.com/free-ebooks/the-great-gatsby.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
  ];

  List<Book> getAllBooks(){
    return _books;
  }
}
