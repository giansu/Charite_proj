function f_megaplot(collector_corr_PLV, collector_corr_AEC, collector_fpeak,G_factor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Questi di seguito  li calcolo solo per poi scalare la colorbar
PLV_lim_tot (1) = min( [min(min(mean(collector_corr_PLV(:,:,:,1),3))), min(min( mean(collector_corr_PLV(:,:,:,2),3))), min(min(mean(collector_corr_PLV(:,:,:,3),3))), min(min(mean(collector_corr_PLV(:,:,:,4),3))), min(min(mean(collector_corr_PLV(:,:,:,5),3)))] );
PLV_lim_tot (2) = max( [max(max(mean(collector_corr_PLV(:,:,:,1),3))), max(max( mean(collector_corr_PLV(:,:,:,2),3))), max(max(mean(collector_corr_PLV(:,:,:,3),3))), max(max(mean(collector_corr_PLV(:,:,:,4),3))), max(max(mean(collector_corr_PLV(:,:,:,5),3)))] );
AEC_lim_tot (1) = min( [min(min(mean(collector_corr_AEC(:,:,:,1),3))), min(min( mean(collector_corr_AEC(:,:,:,2),3))), min(min(mean(collector_corr_AEC(:,:,:,3),3))), min(min(mean(collector_corr_AEC(:,:,:,4),3))), min(min(mean(collector_corr_AEC(:,:,:,5),3)))] );
AEC_lim_tot (2) = max( [max(max(mean(collector_corr_AEC(:,:,:,1),3))), max(max( mean(collector_corr_AEC(:,:,:,2),3))), max(max(mean(collector_corr_AEC(:,:,:,3),3))), max(max(mean(collector_corr_AEC(:,:,:,4),3))), max(max(mean(collector_corr_AEC(:,:,:,5),3)))] );
f_range (1) = min( [min(min(mean(collector_fpeak(:,:,:,1),3)))]);
f_range (2) = max( [max(max(mean(collector_fpeak(:,:,:,1),3)))]);

figure(1)
subplot (3,6,1)
temp = mean(collector_corr_PLV(:,:,:,1),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ', num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([PLV_lim_tot]);
title('Delta') 
ylabel( 'corr between PLVs','fontweight','bold' )
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,2)
temp = mean(collector_corr_PLV(:,:,:,2),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([PLV_lim_tot]);
title('Theta')
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,3)
temp = mean(collector_corr_PLV(:,:,:,3),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 ); %scatter(d(1),(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([PLV_lim_tot]);
title('Alpha')
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,4)
temp = mean(collector_corr_PLV(:,:,:,4),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([PLV_lim_tot]);
title('Beta')
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,5)
temp = mean(collector_corr_PLV(:,:,:,5),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([PLV_lim_tot]);
title('Gamma')
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,6)
axis off
caxis([PLV_lim_tot]);
colorbar


subplot (3,6,7)
temp = mean(collector_corr_AEC(:,:,:,1),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([AEC_lim_tot]);
title('Delta') 
ylabel( 'corr between AECs','fontweight','bold' )
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,8)
temp = mean(collector_corr_AEC(:,:,:,2),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([AEC_lim_tot]);
title('Theta')
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,9)
temp = mean(collector_corr_AEC(:,:,:,3),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([AEC_lim_tot]);
title('Alpha') 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,10)
temp = mean(collector_corr_AEC(:,:,:,4),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([AEC_lim_tot]);
title('Beta') 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,11)
temp = mean(collector_corr_AEC(:,:,:,5),3);
[a,b]=sort(max(temp), 'descend'); [c,d] =sort(max(temp'), 'descend');
str = sprintf(['Max: ',num2str(max(max(round(temp,3))))]);
imagesc(temp); hold on; scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
legend(str,'Location','southOutside')
set(gca,'YDir','normal')
caxis([AEC_lim_tot]);
title('Gamma') 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)

subplot (3,6,12)
axis off
caxis([AEC_lim_tot]);
colorbar


subplot (3,6,15)
temp = mean(collector_fpeak(:,:,:,1),3);
imagesc(temp); hold on; %scatter(b(1),d(1),'filled', 'r', 'linewidth', 2 );
set(gca,'YDir','normal')
caxis([f_range]);
xlabel( 's_{conduction}')
ylabel( 'G_{coupling}')
title('Frequency peak') 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*G_factor)


subplot (3,6,18)
axis off
caxis([f_range]);
colorbar

end