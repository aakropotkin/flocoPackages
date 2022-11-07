{

  inputs.packument.url   = "https://registry.npmjs.org/os-name?rev=28-6d515605a76ec8f2aa47a980904bcd7a";
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
    ident = "os-name";
    ldir  = "info/unscoped/o/os-name";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
