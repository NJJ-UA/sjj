close all;
clear all;

 
tic


Call{1}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{2}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{3}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{4}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{5}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{6}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{7}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{8}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{9}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];
Call{10}=[0.00001 0.0001 0.001 0.01 0.1 1 10 100];



load('svmdatahog.mat');



for i=0:9
    indice=(trainlabels==(i));
    indice=indice*2-1;
    labels{i+1}=indice;
end




testscore=zeros(size(testlabels,2),10);
for i=1:10
    fprintf('For number=%i \n',(i-1));
    [W,b,~]= cross_validate_svm3(trainfeature,labels{i},Call{i},0.5);
    
    
    
    
    
    score=W'*testfeature+b;
    testscore(:,i)=score;
   
end



[M,I]=max(testscore,[],2);

I= bsxfun(@minus,I ,1);

I=I';


errorrate=sum(sign(abs(I-testlabels)))/size(testlabels,2);
disp(errorrate);
toc