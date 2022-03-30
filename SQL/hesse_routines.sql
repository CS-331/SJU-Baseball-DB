-- percentage of pitches resulting in strike
Create or Replace procedure inning_pitch_strike_percentage(inning int, game_id int, strike_percent OUT number)
AS
    tot_pitches int :=0;
    tot_strikes int :=0;
Begin
	Select Count(*) into tot_pitches from play p
    where p.gameid = game_id and p.inningid = inning;
    
	Select Count(*) into tot_strikes from play p
    Where p.PLAYRESULT = 'STRIKE' and p.gameid = game_id and p.inningid = inning;
    strike_percent := tot_strikes/tot_pitches; 
End; 

set serveroutput on;
declare 
    z number;
begin
  inning_pitch_strike_percentage(1,1,z);
  DBMS_OUTPUT.PUT_LINE(z);
end;

-- percentage of pitches resulting in hit
Create or Replace procedure inning_hit_percentage(inning int, game_id int, hit_percent OUT number)
AS
    tot_pitches int :=0;
    tot_hits int :=0;
Begin
	Select Count(*) into tot_pitches from play p
    where p.gameid = game_id and p.inningid = inning;
    
	Select Count(*) into tot_hits from play p
    Where p.PLAYRESULT = 'HIT' and p.gameid = game_id and p.inningid = inning;
    hit_percent := tot_hits/tot_pitches; 
End; 

set serveroutput on;
declare 
    z number;
begin
  inning_hit_percentage(1,1,z);
  DBMS_OUTPUT.PUT_LINE(z);
end;

-- Counts of each pitch type
Create or Replace procedure inning_count_pitchType(inning int, game_id int, ptype string, num_pitches OUT number)
AS
Begin
	Select Count(*) into num_pitches from play p
    where p.gameid = game_id and p.inningid = inning and ptype = p.pitchType;
End; 

set serveroutput on;
declare 
    z number;
begin
  inning_count_pitchType(1,1,'CURVEBALL', z);
  DBMS_OUTPUT.PUT_LINE(z);
end;

-- Number of pitches thrown
Create or Replace procedure inning_count_pitches(inning int, game_id int, num_pitches OUT number)
AS
Begin
	Select Count(*) into num_pitches from play p
    where p.gameid = game_id and p.inningid = inning;
End; 

set serveroutput on;
declare 
    z number;
begin
  inning_count_pitches(1,1, z);
  DBMS_OUTPUT.PUT_LINE(z);
end;