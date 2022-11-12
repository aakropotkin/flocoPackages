{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-syntax-bigint?_rev=35-ecdbc16aea285ec2a52367a2cc14214e";
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
    ident = "@babel/plugin-syntax-bigint";
    ldir  = "info/babel/plugin-syntax-bigint";
    inherit packument fetchInfo;
  } // latest';

}
