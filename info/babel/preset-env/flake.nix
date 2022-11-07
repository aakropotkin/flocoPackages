{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/preset-env?rev=165-943e896329039527df0b5908961eb04c";
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
    ident = "@babel/preset-env";
    ldir  = "info/babel/preset-env";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
