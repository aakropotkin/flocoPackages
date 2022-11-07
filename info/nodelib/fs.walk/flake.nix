{

  inputs.packument.url   = "https://registry.npmjs.org/@nodelib/fs.walk?rev=14-bfe16a2bd53e950c15d8b57e6768846f";
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
    scope = "@nodelib";
    ident = "@nodelib/fs.walk";
    ldir  = "info/nodelib/fs.walk";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
