{

  inputs.packument.url   = "https://registry.npmjs.org/dot?rev=72-5acfded09c4efa7943fd0d413c4f6436";
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
    ident = "dot";
    ldir  = "info/unscoped/d/dot";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
