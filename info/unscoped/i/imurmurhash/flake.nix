{

  inputs.packument.url   = "https://registry.npmjs.org/imurmurhash?rev=19-77c2232a90990af128696907d510ccba";
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
    ident = "imurmurhash";
    ldir  = "info/unscoped/i/imurmurhash";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
