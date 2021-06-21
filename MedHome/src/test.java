import java.util.*;
class node
{
	int data;
	node next;
	node(int d)
	{
		data=d;
	}
}
public class test {
	public static void main(String []args)
	{
		Scanner s=new Scanner(System.in);
		int n=s.nextInt();
		node temp=null,head=null;
		for(int i=0;i<n;i++)
		{
			node n1=new node(s.nextInt());
			if(head==null)
			{
				head=n1;
				temp=n1;
			}
			else
			{
				temp.next=n1;
				temp=temp.next;
				temp=n1;
			}
		}
		temp=head;
		while(temp!=null)
		{
			System.out.println(temp.data);
			temp=temp.next;
		}
		int del=s.nextInt();
		temp=head;
		if(del==temp.data)
		{
			head=temp.next;
			temp=null;
		}
		else
		{
			while(temp!=null)
			{
				if(temp.next.data==del)
				{
					if(temp.next.next!=null)
					{
					temp.next=temp.next.next;
					}
					else
					{
						temp.next=null;
					}
				}
				temp=temp.next;
			}
		}
		temp=head;
		while(temp!=null)
		{
			System.out.println(temp.data);
			temp=temp.next;
		}
	}
}
