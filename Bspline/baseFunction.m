function nik_u = BaseFunction(i,k,u,nodeVector)

if (k == 0)
   if u >= nodeVector(i) && u <= nodeVector(i+1)
       nik_u = 1.0;
   else
       nik_u = 0.0;
   end
   
else
    length1 = nodeVector(i+k) - nodeVector(i);
    length2 = nodeVector(i+k+1) - nodeVector(i+1);
    if length1 == 0.0
       alpha = 0.0;
    else
       alpha = (u-nodeVector(i)) / length1;
    end
    if length2 == 0.0
       beta = 0.0;
    else
       beta = (nodeVector(i+k+1) - u) / length2;
    end
    
    nik_u = alpha * BaseFunction(i, k-1, u, nodeVector) ...
             + beta * BaseFunction(i+1, k-1, u, nodeVector);
    
end

end
