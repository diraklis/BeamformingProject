function  [T1]= final()

    DTH0_min=zeros(6,4);
    DTH0_max=zeros(6,4);
    DTH0_mean=zeros(6,4);
    DTH0_std=zeros(6,4);
    
    SLL_min=zeros(6,4);
    SLL_max=zeros(6,4);
    SLL_mean=zeros(6,4);
    SLL_std=zeros(6,4);

    SINR_min=zeros(6,4);
    SINR_max=zeros(6,4);
    SINR_mean=zeros(6,4);
    SINR_std=zeros(6,4);

    dthetanulls_min=zeros(6,4);
    dthetanulls_max=zeros(6,4);
    dthetanulls_mean=zeros(6,4);
    dthetanulls_std=zeros(6,4);
    for i=1:6
        for k=1:4
            main(i,k);
            DATA=importdata('AoAdev_SINR_SLL.txt');
            dtheta0=DATA.data(1:length(DATA.data),7);

            dthetanulls(1:length(DATA.data),1)=DATA.data(1:length(DATA.data),8);
            dthetanulls(1:length(DATA.data),2)=DATA.data(1:length(DATA.data),9);
            dthetanulls(1:length(DATA.data),3)=DATA.data(1:length(DATA.data),10);
            dthetanulls(1:length(DATA.data),4)=DATA.data(1:length(DATA.data),11);
            dthetanulls(1:length(DATA.data),5)=DATA.data(1:length(DATA.data),12);

            sll=DATA.data(1:length(DATA.data),13);
            sinr=DATA.data(1:length(DATA.data),14);

            DTH0_min(i,k)=round(min(dtheta0),3);
            DTH0_max(i,k)=round(max(dtheta0),3);
            DTH0_mean(i,k)=round(mean(dtheta0),3);
            DTH0_std(i,k)=round(std(dtheta0),3);
            dthetanulls_min(i,k)=round(min(dthetanulls,[],"all"),3);
            dthetanulls_max(i,k)=round(max(dthetanulls,[],"all"),3);
            dthetanulls_mean(i,k)=round(mean(dthetanulls,"all"),3);
            dthetanulls_std(i,k)=round(std(dthetanulls,0,"all"),3);
            
            SLL_min(i,k)=round(min(sll),3);
            SLL_max(i,k)=round(max(sll),3);
            SLL_mean(i,k)=round(mean(sll),3);
            SLL_std(i,k)=round(std(sll),3);

            SINR_min(i,k)=round(min(sinr),3);
            SINR_max(i,k)=round(max(sinr),3);
            SINR_mean(i,k)=round(mean(sinr),3);
            SINR_std(i,k)=round(std(sinr),3);
        end
    end
DTH0_min=reshape(DTH0_min,[24,1]);
DTH0_max=reshape(DTH0_max,[24,1]);
DTH0_mean=reshape(DTH0_mean,[24,1]);
DTH0_std=reshape(DTH0_std,[24,1]);
DTH_0=[DTH0_min,DTH0_max,DTH0_mean,DTH0_std];


NullDiver=zeros(24,4);
NullDiver(1:24,1)=reshape(dthetanulls_min,[24,1]);
NullDiver(1:24,2)=reshape(dthetanulls_max,[24,1]);
NullDiver(1:24,3)=reshape(dthetanulls_mean,[24,1]);
NullDiver(1:24,4)=reshape(dthetanulls_std,[24,1]);

SLL_min=reshape(SLL_min,[24,1]);
SLL_max=reshape(SLL_max,[24,1]);
SLL_mean=reshape(SLL_mean,[24,1]);
SLL_std=reshape(SLL_std,[24,1]);
Sll=[SLL_min,SLL_max,SLL_mean,SLL_std];

SINR_min=reshape(SINR_min,[24,1]);
SINR_max=reshape(SINR_max,[24,1]);
SINR_mean=reshape(SINR_mean,[24,1]);
SINR_std=reshape(SINR_std,[24,1]);
Sinr=[SINR_min,SINR_max,SINR_mean,SINR_std];

format short g
VARNAMES=["Main Lobe Divergence","Null Divergence","SINR","SLL"];
T1 = table(DTH_0,NullDiver,Sinr,Sll,'VariableNames',VARNAMES);
writetable(T1,'results.xlsx','Sheet',1,'Range','A1');

end
