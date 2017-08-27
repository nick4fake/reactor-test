import org.jooq.DSLContext;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.sql.DriverManager;

import static org.jooq.impl.DSL.field;
import static org.jooq.impl.DSL.table;

public class JooqDemo {
    public static void main(String[] args) {
        String userName = "reactor";
        String password = "reactor";
        String url = "jdbc:mysql://localhost:3306/reactor";
        try {
            Connection conn = DriverManager.getConnection(url, userName, password);
            DSLContext create = DSL.using(conn, SQLDialect.MYSQL);
            String sql = create.select(field("AUTHOR.FIRST_NAME"), field("AUTHOR.LAST_NAME"))
                    .from(table("author"))
                    .getSQL();
            System.out.println(sql);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
