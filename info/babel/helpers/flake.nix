{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/helpers?rev=128-6f46633192c02db8ffcf9c60a426ff58";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@babel";
    ident = "@babel/helpers";
    ldir  = "info/babel/helpers";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
