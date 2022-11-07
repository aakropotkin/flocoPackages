{

  inputs.packument.url   = "https://registry.npmjs.org/podium?rev=67-e85882776c760dc32abd4c23be4e0660";
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
    ident = "podium";
    ldir  = "info/unscoped/p/podium";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
