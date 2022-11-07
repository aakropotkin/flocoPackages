{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/register?rev=101-4dcb2bb47d5bbac5c26dfd25353273b2";
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
    ident = "@babel/register";
    ldir  = "info/babel/register";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
