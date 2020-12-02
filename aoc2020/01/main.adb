with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Vectors;

procedure Main is

    package Vec_Int is new Ada.Containers.Vectors
        (Index_Type   => Natural,
         Element_Type => Natural);

    function Sum2_Eq_2020_Prod (V : Vec_Int.Vector) return Integer is
    begin

        for Idx in V.First_Index .. V.Last_Index loop
            for Jdx in Idx .. V.Last_Index loop
                if (V.Element (Idx) + V.Element (Jdx)) = 2020 then
                    return V.Element (Idx) * V.Element (Jdx);
                end if;
            end loop;
        end loop;
        return 0;
    end Sum2_Eq_2020_Prod;

    function Sum3_Eq_2020_Prod (V : Vec_Int.Vector) return Integer is
    begin

        for Idx in V.First_Index .. V.Last_Index loop
            for Jdx in Idx .. V.Last_Index loop
                for Ndx in Jdx .. V.Last_Index loop
                    if (V.Element (Idx) + V.Element (Jdx) + V.Element (Ndx)) = 2020 then
                        return V.Element (Idx) * V.Element (Jdx) * V.Element (Ndx);
                    end if;
                end loop;
            end loop;
        end loop;
        return 0;
    end Sum3_Eq_2020_Prod;

    function isLower (Left, Right : Natural) return Boolean is
    begin

        return Left < Right;
    end isLower;

    package Sorter is new Vec_Int.Generic_Sorting ("<" => isLower);

    File   : File_Type;
    V      : Vec_Int.Vector;
begin
    Open(File => File,
         Mode => In_File,
         Name => "input.txt");

    While not End_Of_File(File) loop
        V.Prepend (Integer'Value (Get_Line (File)));
    end loop;

    Close(File);

    Sorter.Sort(Container => V);
    
    Put_Line ("Sum2: " & Sum2_Eq_2020_Prod (V)'Img);
    Put_Line ("Sum3: " & Sum3_Eq_2020_Prod (V)'Img);

end Main;