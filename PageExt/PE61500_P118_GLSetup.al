pageextension 51500 FBM_GLsetupExt_DF extends "General Ledger Setup"
{
    layout
    {
        addbefore(General)
        {
            field(permset; permset)
            {
                ApplicationArea = all;
                TableRelation = "Aggregate Permission Set"."Role ID";
                caption = 'Permission Set';

            }
            field(permaction; permaction)
            {
                ApplicationArea = all;
                caption = 'Action (0=delete; 1=add)';


            }

        }
    }
    actions
    {
        addlast(processing)
        {
            action("setsites")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.setsite();


                end;

            }

            action("setnames")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.setnames();


                end;

            }

            action("GLE")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.delgle();


                end;

            }


            action("Permission Set")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.setpermset(permset, permaction);


                end;

            }
            action("Adjust ACY")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.fixacystrange();
                    message('done');


                end;

            }
            action("Curr2")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.fixcurr();
                    ;



                end;

            }
            action("exchrate")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.fixexch();




                end;

            }
            action("currvendor")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.fixcurrpurch();

                end;

            }
            action("fixcrm")
            {
                ApplicationArea = all;
                trigger
                OnAction()
                var
                    fix: Codeunit FBM_Fixes;
                begin
                    fix.fixcrm();

                end;

            }


        }

    }
    var
        permset: code[20];
        permaction: integer;
}