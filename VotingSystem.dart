import 'dart:ffi';
import 'dart:io';

void main(){
  Map<String,int>candidates={};
  while(true){
    print("\n...Voting System Project...");
    print("1.Add candidate");
    print('2.View candiate');
    print('3.Cast vote for candidate');
    print("4.Voting result");
    print('5.Find winner');
    print("6.Exit");

    print("Choose an option 1-6:");
    int choose=int.parse(stdin.readLineSync()!);
    if(choose==1){
      addCandidate(candidates);

    }
    else if(choose==2){
      viewCandiate(candidates);

    }
    else if(choose==3){
      castCandidate(candidates);

    }
    else if(choose==4){
      viewResult(candidates);

    }
    else if(choose==5){
      findWinner(candidates);

      
    }
    else if(choose==6){

    }
    else if(choose==7){
      
    }
    else{
      print("You choose the wrong try again!");
      break;
    }

  }
}

void addCandidate(Map<String,int>candidates){
  print("Enter voter name:");
  String name=stdin.readLineSync()!;
  if(name!=null&&name.isNotEmpty){
    if(!candidates.containsKey(name)){

    //this two line will be same work
    // candidates[name]=0;                 ////Single entry
    candidates.addAll({name: 0});           ////Single or multiple entries   vvi

      print("Candidate $name added successfully!");
    }

    else{
      print("Candidate name: $name is already exited in voted");
    }
  }
  else{
    print("Invalid input.Try again!");
  }
}

void viewCandiate(Map<String,int>candidates){
  if(candidates.isEmpty){
    print("There is not available candidate add first:");
    return;            //// Exit without doing anything further    vvi
  }
 else{
   print("List of candidate:");
  for(var candiate in candidates.keys){
    print("The candidate name is : ${candiate}");
  }
 }

}

void castCandidate(Map<String,int>candidates){
  if(candidates.isEmpty){
    print("There is not available candidate add first:");
  }
 else{
   print("Enter your name Cast vote for candidate ");
  String? name=stdin.readLineSync()!;


  ////here this two if condition will be same work 
  // if(candidates.containsKey(name)){
  //   candidates[name]=candidates[name]!+1;
  //   print("Successfully vote caste for candiate $name");
  // }

  //// best way to update               vvi
  if (candidates.containsKey(name)) {
    candidates.update(name, (value) => value + 1); // OR use candidates[name]! + 1
    print("Successfully vote caste for candidate $name");
  }



  else{
    print("Invalid candidate. Try again!");
  }
 }

}

void viewResult(Map<String,int>candidates){
  if(candidates.isEmpty){
    print("There is no result fist need to vote");
  }
  else{
    print("Voting result :");
  for(var candidate in candidates.entries){
    print("Name:${candidate.key} voted gets :${candidate.value}");
  }
  }

}

void findWinner(Map<String,int>candidates){
  if(candidates.isEmpty){
    print("No result availble because no one added and voted:");
    return;    ////// Exit without doing anything further      vvi
  
  }
  else{
    print("Winner Candidate:");
  String winner=candidates.keys.first;
  int heightVote=candidates[winner]!;

  for(var candidate in candidates.entries){
    if(candidate.value>heightVote){
      winner=candidate.key;
      heightVote=candidate.value;
    }
  }
print("Candidate name: ${winner} voted get is:$heightVote");
//// very very important that you can use this two line       //vvi
// var heightVote=candidates.entries.reduce((a,b)=>a.value>=b.value? a:b);
// print("Candidate name: ${heightVote.key} voted get is :${heightVote.value}");

  }


}