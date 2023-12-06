const solution = phone_book => !phone_book.sort().some((num, idx) => idx < phone_book.length - 1 && phone_book[idx + 1].startsWith(num));
