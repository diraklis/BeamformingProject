function  [T1]= final()

    DTH0_min=zeros(6,4);
    DTH0_max=zeros(6,4);
    DTH0_mean=zeros(6,4);
    DTH0_std=zeros(6,4);

    DTH1_min=zeros(6,4);
    DTH1_max=zeros(6,4);
    DTH1_mean=zeros(6,4);
    DTH1_std=zeros(6,4);

    DTH2_min=zeros(6,4);
    DTH2_max=zeros(6,4);
    DTH2_mean=zeros(6,4);
    DTH2_std=zeros(6,4);

    DTH3_min=zeros(6,4);
    DTH3_max=zeros(6,4);
    DTH3_mean=zeros(6,4);
    DTH3_std=zeros(6,4);

    DTH4_min=zeros(6,4);
    DTH4_max=zeros(6,4);
    DTH4_mean=zeros(6,4);
    DTH4_std=zeros(6,4);

    DTH5_min=zeros(6,4);
    DTH5_max=zeros(6,4);
    DTH5_mean=zeros(6,4);
    DTH5_std=zeros(6,4);
    
    SLL_min=zeros(6,4);
    SLL_max=zeros(6,4);
    SLL_mean=zeros(6,4);
    SLL_std=zeros(6,4);

    SINR_min=zeros(6,4);
    SINR_max=zeros(6,4);
    SINR_mean=zeros(6,4);
    SINR_std=zeros(6,4);    

    for i=1:6
        for k=1:4
            main(i,k);
            DATA=importdata('AoAdev_SINR_SLL.txt');
            dtheta0=DATA.data(1:length(DATA.data),7);
            dtheta1=DATA.data(1:length(DATA.data),8);
            dtheta2=DATA.data(1:length(DATA.data),9);
            dtheta3=DATA.data(1:length(DATA.data),10);
            dtheta4=DATA.data(1:length(DATA.data),11);
            dtheta5=DATA.data(1:length(DATA.data),12);
            sll=DATA.data(1:length(DATA.data),13);
            sinr=DATA.data(1:length(DATA.data),14);

            DTH0_min(i,k)=round(min(dtheta0),3);
            DTH0_max(i,k)=round(max(dtheta0),3);
            DTH0_mean(i,k)=round(mean(dtheta0),3);
            DTH0_std(i,k)=round(std(dtheta0),3);

            DTH1_min(i,k)=round(min(dtheta1),3);
            DTH1_max(i,k)=round(max(dtheta1),3);
            DTH1_mean(i,k)=round(mean(dtheta1),3);
            DTH1_std(i,k)=round(std(dtheta1),3);

            DTH2_min(i,k)=round(min(dtheta2),3);
            DTH2_max(i,k)=round(max(dtheta2),3);
            DTH2_mean(i,k)=round(mean(dtheta2),3);
            DTH2_std(i,k)=round(std(dtheta2),3);

            DTH3_min(i,k)=round(min(dtheta3),3);
            DTH3_max(i,k)=round(max(dtheta3),3);
            DTH3_mean(i,k)=round(mean(dtheta3),3);
            DTH3_std(i,k)=round(std(dtheta3),3);

            DTH4_min(i,k)=round(min(dtheta4),3);
            DTH4_max(i,k)=round(max(dtheta4),3);
            DTH4_mean(i,k)=round(mean(dtheta4),3);
            DTH4_std(i,k)=round(std(dtheta4),3);

            DTH5_min(i,k)=round(min(dtheta5),3);
            DTH5_max(i,k)=round(max(dtheta5),3);
            DTH5_mean(i,k)=round(mean(dtheta5),3);
            DTH5_std(i,k)=round(std(dtheta5),3);
            
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

DTH1_min=reshape(DTH0_min,[24,1]);
DTH1_max=reshape(DTH1_max,[24,1]);
DTH1_mean=reshape(DTH1_mean,[24,1]);
DTH1_std=reshape(DTH1_std,[24,1]);
DTH_1=[DTH1_min,DTH1_max,DTH1_mean,DTH1_std];

DTH2_min=reshape(DTH2_min,[24,1]);
DTH2_max=reshape(DTH2_max,[24,1]);
DTH2_mean=reshape(DTH2_mean,[24,1]);
DTH2_std=reshape(DTH2_std,[24,1]);
DTH_2=[DTH2_min,DTH2_max,DTH2_mean,DTH2_std];

DTH3_min=reshape(DTH3_min,[24,1]);
DTH3_max=reshape(DTH3_max,[24,1]);
DTH3_mean=reshape(DTH3_mean,[24,1]);
DTH3_std=reshape(DTH3_std,[24,1]);
DTH_3=[DTH3_min,DTH3_max,DTH3_mean,DTH3_std];

DTH4_min=reshape(DTH4_min,[24,1]);
DTH4_max=reshape(DTH4_max,[24,1]);
DTH4_mean=reshape(DTH4_mean,[24,1]);
DTH4_std=reshape(DTH4_std,[24,1]);
DTH_4=[DTH4_min,DTH4_max,DTH4_mean,DTH4_std];

DTH5_min=reshape(DTH5_min,[24,1]);
DTH5_max=reshape(DTH5_max,[24,1]);
DTH5_mean=reshape(DTH5_mean,[24,1]);
DTH5_std=reshape(DTH5_std,[24,1]);
DTH_5=[DTH5_min,DTH5_max,DTH5_mean,DTH5_std];

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
VARNAMES=["Δθ0","Δθ1","Δθ2","Δθ3","Δθ4","Δθ5","SINR","SLL"];
T1 = table(DTH_0,DTH_1,DTH_2,DTH_3,DTH_4,DTH_5,Sinr,Sll,'VariableNames',VARNAMES);
writetable(T1,'results.xlsx','Sheet',1,'Range','A1');

end
