v1 = randi ([0 9] ,1 ,30);
v2 = randi ([0 9] ,1 ,30);
v3 = zeros(1, 31); % 31 if last addition results in 2 digits
sum = 0; fdigit = 0;

for i = 30:-1:1
    sum = v1(i) + v2(i);
    if sum < 10 %if result is one digit
        v3(i+1) = sum;
        v3(i+1) += fdigit; %adds first digit from last, if applicable
        fdigit = 0; %resets
    else %if result is two digits
        v3(i+1) += fdigit; %adds first digit from last, if applicable
        v3(i+1) = mod(sum, 10);   % adds second digit
        fdigit = (sum - mod(sum, 10)) / 10; %sets first digit to f
    endif 
endfor  
if (v1(1) + v2(1) >= 10)% if last + = 2 digits, add the first
    v3(1) = fdigit;
endif
