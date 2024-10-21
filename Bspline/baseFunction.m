function nik_u = baseFunction(i,k,u,nodeVector)

if k == 0
   if all(u >= nodeVector(i)) && all(u <= nodeVector(i+1))
       nik_u = 1.0;
   else
       nik_u = 0.0;
   end
   
else
   length1 = nodeVector(i+k) - nodeVector(i);
   length2 = nodeVector(i+k+1) - nodeVector(i+1);
   if length1 == 0.0
       length1 = 1.0;
   end
   if length2 == 0.0
       length2 = 1.0;
   end
   
   nik_u = (u-nodeVector(i)) / length1 * baseFunction(i, k-1, u, nodeVector)...
       + (nodeVector(i+k+1) - u) / length2 * baseFunction(i+1, k-1, u, nodeVector);  
   
end

end