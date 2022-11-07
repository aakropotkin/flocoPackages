{

  inputs.packument.url   = "https://registry.npmjs.org/touch?rev=38-64a8e3663bd51fd039d9062fb33c0590";
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
    ident = "touch";
    ldir  = "info/unscoped/t/touch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
