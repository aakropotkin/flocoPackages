{

  inputs.packument.url   = "https://registry.npmjs.org/commist?rev=19-a6fdbc08bfb590653965212216681649";
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
    ident = "commist";
    ldir  = "info/unscoped/c/commist";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
