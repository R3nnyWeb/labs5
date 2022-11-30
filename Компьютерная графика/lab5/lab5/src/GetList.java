import javax.imageio.*;
//Чтобы узнать, какой набор установлен для чтения и записи,
//можно спросить об этом класс ImageIO через его методы
//getReaderFormatNames() и getWriterFormatNames() 
//или getReaderMIMETypes() и getWriterMIMETypes(), 
//если хотите работать непосредственно с MIME типами
public class GetList {
    public static void main(String args[]) {
//Читатели по имени формата
        String readerNames[] = ImageIO.getReaderFormatNames();
        printlist(readerNames, "Reader names:");
        //Читатели по MIME
        String readerMimes[] = ImageIO.getReaderMIMETypes();
        printlist(readerMimes, "Reader MIME types:");
        //Писатели по имени формата
        String writerNames[] = ImageIO.getWriterFormatNames();
        printlist(writerNames, "Writer names:");
        //Писатели по MIME
        String writerMimes[] = ImageIO.getWriterMIMETypes();
        printlist(writerMimes, "Writer MIME types:");
    }
    private static void printlist(String names[], String title) {
        System.out.println(title);
        for (int i = 0, n = names.length; i < n; i++) {
            System.out.println("\t" + names[i]);
        }
    }
}
