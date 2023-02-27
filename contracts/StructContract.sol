pragma solidity >=0.7.0 <0.9.0;

contract StructContract {
    // struct

    struct Book {
        string title;
        string author;
        uint id;
        bool isReady;
    }

    Book book1;

    function addBook() public {
        book1 = Book("pemograman solidity", "john", 1, true);
    }

    function getBook() public view returns (string memory, string memory, uint, bool) {
        return (book1.title, book1.author, book1.id, book1.isReady);
    }


    Book book2 = Book("membuat dapps", "kennedy", 12, false);

    function getBook2() public view returns (string memory, string memory, uint, bool) {
        return (book2.title, book2.author, book2.id, book2.isReady);
    }


    Book[] public books;

    function newBook(string memory title, string memory author, uint id, bool isReady) public {
        books.push(Book(title, author, id, isReady));
    }

    function infoBook(uint _index) public view returns (string memory, string memory, uint, bool) {
        Book storage book = books[_index];
        return (book.title, book.author, book.id, book.isReady);
    }
}