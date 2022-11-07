{

  inputs.packument.url   = "https://registry.npmjs.org/bytes?rev=68-dcd72b4b837fbe3bd790fcabfc42f78f";
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
    ident = "bytes";
    ldir  = "info/unscoped/b/bytes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
