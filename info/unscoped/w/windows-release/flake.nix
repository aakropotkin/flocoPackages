{

  inputs.packument.url   = "https://registry.npmjs.org/windows-release?rev=10-6f2fad2bca1310917f38d354b9fc51e5";
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
    ident = "windows-release";
    ldir  = "info/unscoped/w/windows-release";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
