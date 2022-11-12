{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/resp-modifier?_rev=53-eea803416c0c89a7c2b66af65161cca1";
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
    scope = null;
    ident = "resp-modifier";
    ldir  = "info/unscoped/r/resp-modifier";
    inherit packument fetchInfo;
  } // latest';

}
