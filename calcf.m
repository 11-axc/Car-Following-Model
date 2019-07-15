function [fx,fv]=calcf(x,v,fx,fv,N,L,a,c)
    for i=1:N
        if i~=N 
            dx=x(i+1)-x(i);     %dx��ǰ������֮��ľ���
        else
            dx=x(1)-x(N);       %�������һ������ʱ�򣬻������У�
        end
        if dx<-L*0.5
            dx=dx+L;
        end
        if dx<0
           error('����')
        end
        fv(i)=a*(tanh(dx-c)+tanh(c)-v(i));  %����v�ĵ�����ֵ
    end
    for j=1:N
        fx(j)=v(j);         %����x�ĵ�����ֵ
    end 
end