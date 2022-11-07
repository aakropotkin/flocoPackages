{

  inputs.packument.url   = "https://registry.npmjs.org/truncate-utf8-bytes?rev=9-5d4b74f56e6251a544a376aeff8d84b3";
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
    ident = "truncate-utf8-bytes";
    ldir  = "info/unscoped/t/truncate-utf8-bytes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
