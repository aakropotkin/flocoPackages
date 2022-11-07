{

  inputs.packument.url   = "https://registry.npmjs.org/multicast-dns?rev=61-919aa83ba4b3a32b09a8c1277b81dce9";
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
    ident = "multicast-dns";
    ldir  = "info/unscoped/m/multicast-dns";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
