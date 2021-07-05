public class PtBacHai {
    public static void main(String[] args) {

    }
    public static void pt(int a, int b, int c){
        if (a==0){
            if (b==0){
                System.out.println("Vô Nghiệm");
            }else {
                int x = -c/b;
                System.out.println("Nghiệm phương trình là: " + x);
            }
        }else {
            int del = b*b-4*a*c;
            if (del<0){
                System.out.println("Pt vô nghiệm");
            }else {
                if (del==0){
                    System.out.println("Pt có nghiệm kép x1=x2="+ (-b/a));
                }else {
                    System.out.println("pt có 2 nghiệm phân biệt x1 = "+((-b+Math.sqrt(del))/(2*a))
                    + "x2 = "+((-b-Math.sqrt(del))/(2*a)));
                }
            }
        }
    }
}
